import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/app/presenter/navigation_cubit.dart';
import 'package:git_stat/releases/view/releases_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.pageIndex,
            onDestinationSelected: (index) =>
                context.read<NavigationCubit>().selectPage(pageIndex: index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.new_releases),
                label: 'Releases',
              ),
              NavigationDestination(
                icon: Icon(Icons.star),
                label: 'Top',
              ),
              NavigationDestination(
                icon: Icon(Icons.pie_chart),
                label: 'Chart',
              ),
            ],
          ),
          appBar: AppBar(
            title: const Text('Flutter GitStat'),
          ),
          body: Center(
            child: switch (state.page) {
              NavigationPages.releases => const ReleasesPage(),
              _ => const Text('Others'),
            },
          ),
          // body: Center(
          //     child: [
          //   const Text('Releases'),
          //   const Text('Top'),
          //   const Text('Chart')
          // ][state.pageIndex]),

          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (_) => const MyReposPage(),
          //           settings: const RouteSettings(
          //             name: 'Hmm',
          //             arguments: <String, int>{
          //               'Here are my arguments, 2 pcs': 1
          //             },
          //           ),
          //         ),
          //       );
          //     },
          //     child: const Text('to MyRepos'),
          //   ),
          // ),
        );
      }),
    );
  }
}
