part of 'chart_cubit.dart';

enum ChartStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ChartStatus.initial;
  bool get isLoading => this == ChartStatus.loading;
  bool get isSuccess => this == ChartStatus.success;
  bool get isFailure => this == ChartStatus.failure;
}

@freezed
class ChartState with _$ChartState {
  const factory ChartState({
    @Default(ChartStatus.initial) ChartStatus status,
    @Default([]) List<Repo> repos,
  }) = _ChartState;
}
