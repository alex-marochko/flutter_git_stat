import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_stat/core/source/github_repository.dart';
import 'package:git_stat/my_repos/model/my_repo.dart';

part 'my_repos_cubit.freezed.dart';
part 'my_repos_state.dart';

class MyReposCubit extends Cubit<MyReposState> {
  MyReposCubit() : super(const MyReposState()) {
    _repository = GithubRepository();
  }

  late final GithubRepository _repository;

  Future<void> fetchMyRepos() async {
    emit(state.copyWith(status: MyReposStatus.loading));

    late final List<MyRepo> repos;
    try {
      repos = await _repository.getMyRepositories();
    } catch (e) {
      emit(const MyReposState(status: MyReposStatus.failure));
      log(e.toString());
      rethrow;
    }
    emit(state.copyWith(status: MyReposStatus.success, repos: repos));
  }
}
