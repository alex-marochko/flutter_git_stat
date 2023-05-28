import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_stat/core/source/github_repository.dart';
import 'package:git_stat/releases/model/released_repository.dart';

part 'releases_cubit.freezed.dart';
part 'releases_state.dart';

class ReleasesCubit extends Cubit<ReleasesState> {
  ReleasesCubit() : super(const ReleasesState()) {
    _repository = GithubRepository();
  }

  late final GithubRepository _repository;

  Future<void> fetchReleases() async {
    emit(state.copyWith(status: ReleasesStatus.loading));

    late final List<ReleasedRepository> repos;
    try {
      // fetching repositories updated/released within the last month
      repos = await _repository.getReleasedRepositories(
        DateTime.now().subtract(const Duration(days: 180)),
      );
    } catch (e) {
      emit(const ReleasesState(status: ReleasesStatus.failure));
      log(e.toString());
      rethrow;
    }
    emit(state.copyWith(status: ReleasesStatus.success, repos: repos));
  }
}
