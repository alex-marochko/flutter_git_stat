import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_stat/core/source/github_repository.dart';
import 'package:git_stat/releases/model/released_repository.dart';

part 'releases_cubit.freezed.dart';
part 'releases_state.dart';

class ReleasesCubit extends Cubit<ReleasesState> {
  ReleasesCubit({required this.repository}) : super(ReleasesState());

  final GithubRepository repository;

  void fetchReleases() async {
    emit(state.copyWith(status: ReleasesStatus.loading, message: null));

    final dateFrom = DateTime.now().subtract(
        const Duration(days: 180)); // TODO: make this duration configurable

    final (data, failure, cache) =
        await repository.getReleasedRepositories(dateFrom);

    final repos = data ?? [];
    Message message;
    bool emittedAlready = false;

    if (failure != null) {
      message = Message(failure.standardMessage, MessageStatus.bad);
      emit(ReleasesState(
          status: ReleasesStatus.failure, repos: repos, message: message));
      emittedAlready = true;
    }

    if (cache ?? false) {
      message = const Message('Cached data', MessageStatus.warning);
      emit(ReleasesState(
          status: ReleasesStatus.success, repos: repos, message: message));
      emittedAlready = true;
    }

    if (!emittedAlready) {
      emit(ReleasesState(status: ReleasesStatus.success, repos: repos));
    }

/*
    final reposOrFailure =
        repository.getReleasedRepositories(dateFrom).map((r) {
      emit(state.copyWith(status: ReleasesStatus.success, repos: r));
    }).mapLeft((l) {
      emit(state.copyWith(status: ReleasesStatus.failure, failure: l));
    });

    reposOrFailure.run();
*/
    // reposOrFailure.emit(const ReleasesState(status: ReleasesStatus.failure));
    // emit(state.copyWith(status: ReleasesStatus.success, repos: repos));
  }
}
