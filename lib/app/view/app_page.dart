import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/app/presenter/navigation_cubit.dart';
import 'package:git_stat/app/view/destinations.dart';
import 'package:git_stat/core/source/github_repository.dart';
import 'package:git_stat/releases/view/releases_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  static const _maxNavigationBarWidth = 550;
  static const _maxNavigationRailWidth = 1100;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late double _width;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _width = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GithubRepository(),
      child: BlocProvider(
        create: (context) => NavigationCubit(),
        child: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: (_width <= AppPage._maxNavigationBarWidth)
                ? NavigationBar(
                    selectedIndex: state.pageIndex,
                    onDestinationSelected: (index) => context
                        .read<NavigationCubit>()
                        .selectPage(pageIndex: index),
                    destinations: Destination.navigationBarItems,
                  )
                : null,
            appBar: AppBar(
              title: const Text('Flutter GitStat'),
            ),
            body: Row(
              children: [
                if (_width > AppPage._maxNavigationBarWidth)
                  //   if (_width <= AppPage._maxNavigationRailWidth)
                  NavigationRail(
                    onDestinationSelected: (i) => context
                        .read<NavigationCubit>()
                        .selectPage(pageIndex: i),
                    destinations: Destination.navigationRailItems,
                    selectedIndex: state.pageIndex,
                    extended: (_width > AppPage._maxNavigationRailWidth),
                    labelType: (_width <= AppPage._maxNavigationRailWidth)
                        ? NavigationRailLabelType.all
                        : NavigationRailLabelType.none,
                  ),
                Expanded(
                  child: Center(
                    child: switch (state.page) {
                      NavigationPages.releases => const ReleasesPage(),
                      _ => const Text('Others'),
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
