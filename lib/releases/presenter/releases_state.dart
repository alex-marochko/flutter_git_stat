part of 'releases_cubit.dart';

enum ReleasesStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ReleasesStatus.initial;
  bool get isLoading => this == ReleasesStatus.loading;
  bool get isSuccess => this == ReleasesStatus.success;
  bool get isFailure => this == ReleasesStatus.failure;
}

@freezed
class ReleasesState with _$ReleasesState {
  const factory ReleasesState({
    @Default(ReleasesStatus.initial) ReleasesStatus status,
    @Default([]) List<ReleasedRepository> repos,
  }) = _ReleasesState;
}
