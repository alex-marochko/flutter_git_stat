import 'package:freezed_annotation/freezed_annotation.dart';

part 'repo.freezed.dart';

@freezed
class Repo with _$Repo {
  const factory Repo({
    required String id,
    required String name,
    required bool viewerHasStarred,
  }) = _Repo;
}
