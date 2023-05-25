import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_stat/my_repos/model/my_repo.dart';

part 'my_repo_dto.g.dart';

@JsonSerializable(createPerFieldToJson: false)
class MyRepoDto {
  final String id;
  final String name;
  final bool viewerHasStarred;

  MyRepoDto({
    required this.id,
    required this.name,
    required this.viewerHasStarred,
  });

  factory MyRepoDto.fromJson(Map<String, dynamic> json) =>
      _$MyRepoDtoFromJson(json);

  MyRepo toDomain() => MyRepo(
        id: id,
        name: name,
        viewerHasStarred: viewerHasStarred,
      );
}
