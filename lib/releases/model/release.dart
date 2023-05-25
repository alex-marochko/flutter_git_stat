import 'package:freezed_annotation/freezed_annotation.dart';

part 'release.freezed.dart';

@freezed
class Release with _$Release {
  const factory Release({
    required String name,
    required DateTime createdAt,
    required String description,
  }) = _Release;
}
