part of 'navigation_cubit.dart';

enum NavigationPages { releases, top, chart }

class NavigationState extends Equatable {
  const NavigationState({this.page = NavigationPages.releases});

  const NavigationState.initial() : this(page: NavigationPages.top);
  const NavigationState.releases() : this(page: NavigationPages.releases);
  const NavigationState.top() : this(page: NavigationPages.top);
  const NavigationState.chart() : this(page: NavigationPages.chart);

  final NavigationPages page;

  int get pageIndex => NavigationPages.values.indexOf(page);

  @override
  List<Object> get props => [page];
}
