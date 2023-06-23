import 'dart:developer';

import 'package:git_stat/core/source/github_provider.dart';
import 'package:git_stat/core/source/request_failure.dart';
import 'package:git_stat/releases/model/released_repository.dart';
import 'package:git_stat/releases/source/released_repository_dto.dart';
import 'package:graphql/client.dart';
import 'package:intl/intl.dart';

// Decided to keep all Github requests in one class, because separating without
// base class leads to code repeating, and while extending from base class
// we are forced to make public getter for [_provider], which is inappropriate.

class GithubRepository {
  GithubRepository() {
    _provider = GithubProvider();
  }

  late final GithubProvider _provider;

  Future<
          (
            List<ReleasedRepository>?,
            RequestFailure?,
            bool?
          )> // 'bool' for 'cached'
      getReleasedRepositories(DateTime fromDateTime) async {
    final formatter = DateFormat('yyyy-MM-dd');
    final String fromString = formatter.format(fromDateTime);
    // TODO the list looks a bit strange when is sorted by stars. Change to date?
    final updatedReposQuery = '''
            {
              search(
                query: "language:Dart stars:>100 created:>=$fromString"
                type: REPOSITORY
                first: 50
              ) {
                repositoryCount
                edges {
                  node {
                    ... on Repository {
                      id
                      name
                      nameWithOwner
                      description
                      url
                      createdAt
                      stargazers {
                        totalCount
                      }
                      owner {
                        id
                        login                      
                        avatarUrl
                      }
                      releases(last: 1, orderBy: {field: CREATED_AT, direction: DESC}) {
                        edges {
                          node {
                            name
                            createdAt
                            description
                          }
                        }
                      }
                    }
                  }
                }
              }
            } 
            ''';

    late final QueryResult<Object?> queryResult;
    late final List<ReleasedRepository>? data;
    RequestFailure? failure;
    late final bool? cache;

    try {
      queryResult = await _provider.sendQuery(
        updatedReposQuery,
        {},
      );

      // final rawData = queryResult.data;

/*
        if ((rawData == null || rawData.isEmpty) && queryResult.hasException) {
          // no data, just errors
          throw queryResult.exception!;
        }
*/
      log('$this:\n'
          'hasException: ${queryResult.hasException}\n'
          'exceptions: ${queryResult.exception}\n'
          'data: ${queryResult.data}\n'
          'source: ${queryResult.source}');

      data = (queryResult.data == null)
          ? null
          : List<ReleasedRepository>.from(queryResult.data!['search']['edges']
              .map((value) => ReleasedRepositoryDto.fromJson(value).toModel()));
    } catch (error, stackTrace) {
      log('github_repository: cacth error: ${error.toString()}\n$stackTrace');
      if (error is OperationException) {
        final errorsMessages = error.graphqlErrors.fold<String>(
            '', (previousValue, element) => '$previousValue; $element');
        failure = RequestFailure.server(errorsMessages);
      } else {
        failure = RequestFailure.something(error.toString());
      }
    }

    if (failure == null && queryResult.hasException) {
      if (queryResult.exception!.linkException != null) {
        final linkException = queryResult.exception!.linkException;
        if (linkException is NetworkException) {
          failure = RequestFailure.network(linkException.message);
        } else if (linkException is ServerException) {
          failure =
              RequestFailure.server(linkException.originalException.toString());
        }
      }
      failure ??= RequestFailure.something(queryResult.exception.toString());
    }

    cache = queryResult.source == QueryResultSource.cache;

    return (data, failure, cache);
  }
}
