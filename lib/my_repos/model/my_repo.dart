import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_repo.freezed.dart';

@freezed
class MyRepo with _$MyRepo {
  const factory MyRepo({
    required String id,
    required String name,
    required bool viewerHasStarred,
  }) = _MyRepo;
}
