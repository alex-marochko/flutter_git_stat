import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.initial());

  void selectPage({required int pageIndex}) {
    final page = NavigationPages.values[pageIndex];
    emit(NavigationState(page: page));
  }
}
