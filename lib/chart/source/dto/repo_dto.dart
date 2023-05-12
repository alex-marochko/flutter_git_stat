import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_stat/chart/model/repo.dart';

part 'repo_dto.g.dart';

@JsonSerializable(createPerFieldToJson: false)
class RepoDto {
  final String id;
  final String name;
  final bool viewerHasStarred;

  RepoDto({
    required this.id,
    required this.name,
    required this.viewerHasStarred,
  });

  factory RepoDto.fromJson(Map<String, dynamic> json) =>
      _$RepoDtoFromJson(json);

  Repo toDomain() => Repo(
        id: id,
        name: name,
        viewerHasStarred: viewerHasStarred,
      );
}
