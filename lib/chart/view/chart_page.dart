import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/chart/presenter/chart_cubit.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Chart'),
      ),
      body: Center(
        child: BlocBuilder<ChartCubit, ChartState>(
          builder: (context, state) {
            switch (state.status) {
              case ChartStatus.initial:
                return const Text('Press "+" floating button');
              case ChartStatus.loading:
                return const CircularProgressIndicator();
              case ChartStatus.success:
                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.repos[index].name),
                    leading:
                        Text(state.repos[index].viewerHasStarred ? '★' : ''),
                  ),
                  // Text(state.repos[index].name),
                  itemCount: state.repos.length,
                );
              case ChartStatus.failure:
                return const Text(
                  'Error',
                  style: TextStyle(color: Colors.red),
                );
            }
            return const Text('My Chart');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ChartCubit>().fetchMyRepos(),
        tooltip: 'Get repositories',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
