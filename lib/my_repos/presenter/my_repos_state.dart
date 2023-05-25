part of 'my_repos_cubit.dart';

enum MyReposStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == MyReposStatus.initial;
  bool get isLoading => this == MyReposStatus.loading;
  bool get isSuccess => this == MyReposStatus.success;
  bool get isFailure => this == MyReposStatus.failure;
}

@freezed
class MyReposState with _$MyReposState {
  const factory MyReposState({
    @Default(MyReposStatus.initial) MyReposStatus status,
    @Default([]) List<MyRepo> repos,
  }) = _MyReposState;
}
