import 'package:git_stat/core/source/github_provider.dart';
import 'package:git_stat/my_repos/model/my_repo.dart';
import 'package:git_stat/releases/model/released_repository.dart';
import 'package:git_stat/releases/source/released_repository_dto.dart';
import 'package:intl/intl.dart';

import '../../my_repos/source/my_repo_dto.dart';

// Decided to keep all Github requests in one class, because separating without
// base class leads to code repeating, and while extending from base class
// we are forced to make public getter for [_provider], which is inappropriate.

class GithubRepository {
  GithubRepository() {
    _provider = GithubProvider();
  }

  late final GithubProvider _provider;

  Future<List<MyRepo>> getMyRepositories() async {
    const readRepositories = """
      query ReadRepositories(\$nRepositories: Int!) {
        viewer {
          repositories(last: \$nRepositories) {
            nodes {
              id
              name
              viewerHasStarred
            }
          }
        }
      }
      """;

    const param = {'nRepositories': 50};

    final rawData = await _provider.sendQuery(readRepositories, param);

    if (rawData == null || rawData.isEmpty) throw Exception('No data');

    return List.from(rawData['viewer']['repositories']['nodes']!
        .map((value) => MyRepoDto.fromJson(value).toDomain()));
  }

  Future<dynamic> getReleasedRepositories(DateTime fromDateTime) async {
    final formatter = DateFormat('yyyy-MM-dd');
    final String fromString = formatter.format(fromDateTime);
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
                      stargazers {
                        totalCount
                      }
                      owner {
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

    final rawData = await _provider.sendQuery(
      updatedReposQuery,
      {},
    );

    if (rawData == null || rawData.isEmpty) throw Exception('No data');

    return List<ReleasedRepository>.from(rawData['search']['edges']!
        .map((value) => ReleasedRepositoryDto.fromJson(value).toModel()));
  }
}
