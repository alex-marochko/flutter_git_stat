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
  static final _authLink = AuthLink(
      getToken: () =>
          'Bearer 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');

  static final _link = _authLink.concat(_httpLink);

  Future<Map<String, dynamic>?> sendQuery(
    String queryText,
    Map<String, dynamic> parameters,
  ) async {
    final QueryOptions options = QueryOptions(
      document: gql(queryText),
      variables: parameters,
    );

    final QueryResult result = await _client.query(options);

/*
    if (result.hasException) {
      print(result.exception.toString());
    }
*/
    return result.data;
  }
}
