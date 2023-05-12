import 'package:git_stat/chart/model/repo.dart';
import 'package:git_stat/core/source/github_provider.dart';

import 'dto/repo_dto.dart';

class ChartRepository {
  ChartRepository() {
    _provider = GithubProvider();
  }

  late final GithubProvider _provider;

  Future<List<Repo>> getMyRepositories() async {
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
        .map((value) => RepoDto.fromJson(value).toDomain()));
  }
}
