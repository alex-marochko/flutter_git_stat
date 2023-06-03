import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_state.dart';
part 'repository_cubit.freezed.dart';

class RepositoryCubit extends Cubit<RepositoryState> {
  RepositoryCubit() : super(const RepositoryState.initial());
}
