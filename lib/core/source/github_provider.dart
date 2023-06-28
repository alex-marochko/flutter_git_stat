import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:graphql/client.dart';

class GithubProvider {
  GithubProvider() {
    _client = GraphQLClient(
      link: _link,
      cache: GraphQLCache(),
    );
  }

  late final GraphQLClient _client;

  static final _httpLink = HttpLink('https://api.github.com/graphql');
  static final _token = FirebaseRemoteConfig.instance.getString('github_token');
  static final _authLink = AuthLink(
      getToken: () =>
          'Bearer $_token'); // this should be a token with read-only permissions

  static final _link = _authLink.concat(_httpLink);

  Future<QueryResult<Object?>> sendQuery(
    String queryText,
    Map<String, dynamic>? parameters,
  ) async {
    final QueryOptions options = QueryOptions(
      pollInterval:
          const Duration(seconds: 10), // TODO - separate config constants
      document: gql(queryText),
      variables: parameters ?? {},
      errorPolicy: ErrorPolicy.all,
      onError: (error) {
        log('guthub_provider: $error');
        throw (error ?? Exception('Unknown error'));
      },
      onComplete: (data) {
        log('guthub_provider: $data');
        // return data;
      },
    );

    final result = await _client.query(options);
    return result;
  }
}
