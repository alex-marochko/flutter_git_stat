import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/releases/presenter/releases_cubit.dart';

class ReleasesPage extends StatelessWidget {
  const ReleasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReleasesCubit>(
      create: (_) => ReleasesCubit(),
      child:
          BlocBuilder<ReleasesCubit, ReleasesState>(builder: (context, state) {
        return switch (state.status) {
          ReleasesStatus.initial => Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ReleasesCubit>().fetchReleases();
                },
                child: const Text('Push me'),
              ),
            ),
          ReleasesStatus.loading => const CircularProgressIndicator(),
          ReleasesStatus.success => ListView.builder(
              itemCount: state.repos.length,
              itemBuilder: (context, id) {
                return ListTile(
                  title: Text(state.repos[id].name),
                  subtitle: Text(state.repos[id].url),
                );
              }),
          _ => const Center(child: Text('Oops'))
        };
      }),
    );
  }
}
