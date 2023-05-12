import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_stat/chart/model/repo.dart';
import 'package:git_stat/chart/source/chart_repository.dart';

part 'chart_cubit.freezed.dart';
part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit() : super(const ChartState()) {
    _repository = ChartRepository();
  }

  late final ChartRepository _repository;

  Future<void> fetchMyRepos() async {
    emit(state.copyWith(status: ChartStatus.loading));

    late final List<Repo> repos;
    try {
      repos = await _repository.getMyRepositories();
    } catch (e) {
      emit(const ChartState(status: ChartStatus.failure));
      log(e.toString());
      rethrow;
    }
    emit(state.copyWith(status: ChartStatus.success, repos: repos));
  }
}
