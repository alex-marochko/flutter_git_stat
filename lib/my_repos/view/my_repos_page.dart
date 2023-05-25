import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/my_repos/presenter/my_repos_cubit.dart';

class MyReposPage extends StatelessWidget {
  const MyReposPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyReposCubit(),
      child: Builder(builder: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, int>;
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Repositories'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<MyReposCubit, MyReposState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case MyReposStatus.initial:
                        return const Text('Press "+" floating button');
                      case MyReposStatus.loading:
                        return const CircularProgressIndicator();
                      case MyReposStatus.success:
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemBuilder: (context, index) => ListTile(
                              title: Text(state.repos[index].name),
                              leading: Text(state.repos[index].viewerHasStarred
                                  ? '★'
                                  : ''),
                            ),
                            // Text(state.repos[index].name),
                            itemCount: state.repos.length,
                          ),
                        );
                      case MyReposStatus.failure:
                        return const Text(
                          'Error',
                          style: TextStyle(color: Colors.red),
                        );
                    }
                  },
                ),
                Text(args.toString()),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<MyReposCubit>().fetchMyRepos(),
            tooltip: 'Get repositories',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }),
    );
  }
}
