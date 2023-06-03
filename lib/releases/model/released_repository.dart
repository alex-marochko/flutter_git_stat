import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_stat/releases/model/release.dart';

part 'released_repository.freezed.dart';

@freezed
class ReleasedRepository with _$ReleasedRepository {
  const factory ReleasedRepository({
    required String id,
    required String name,
    required String nameWithOwner,
    required String ownerName,
    String? description,
    required String url,
    required String ownerAvatarUrl,
    required int stargazersCount,
    required DateTime createdAt,
    required List<Release> releases,
  }) = _ReleasedRepository;
}
