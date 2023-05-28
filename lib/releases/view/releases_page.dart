import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/releases/presenter/releases_cubit.dart';

class ReleasesPage extends StatelessWidget {
  const ReleasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReleasesCubit>(
      create: (_) {
        final cubit = ReleasesCubit();
        cubit.fetchReleases();
        return cubit;
      },
      child:
          BlocBuilder<ReleasesCubit, ReleasesState>(builder: (context, state) {
        return switch (state.status) {
          ReleasesStatus.initial ||
          ReleasesStatus.loading =>
            const CircularProgressIndicator(),
          ReleasesStatus.success => ReleasesList(
              state: state,
            ),
          _ => const Center(child: Text('Oops'))
        };
      }),
    );
  }
}

class ReleasesList extends StatelessWidget {
  const ReleasesList({
    super.key,
    required this.state,
  });

  final ReleasesState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.repos.length,
      itemBuilder: (context, i) {
        return ExpansionTile(
          key: PageStorageKey(state.repos[i].id),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(state.repos[i].ownerAvatarUrl),
          ),
          title: Text(state.repos[i].nameWithOwner),
          subtitle: Text(
            state.repos[i].description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: Text('⭐${state.repos[i].stargazersCount}'),
          maintainState: true,
          children: [
            ...state.repos[i].releases.map((r) => ListTile(
                  subtitle: Text(
                    r.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
          ],
        );

        /*ListTile(
          enableFeedback: true,
          onTap: () {
            log('hey');
          },
          onLongPress: () {
            log('hey');
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(state.repos[id].ownerAvatarUrl),
            // child: Image.network(state.repos[id].ownerAvatarUrl),
          ),
          title: Text(state.repos[id].nameWithOwner),
          subtitle: Text(state.repos[id].url),
        );*/
      },
/*      separatorBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          height: 1,
          margin: const EdgeInsets.only(left: 64),
          decoration: const ShapeDecoration(
            shape: LinearBorder(),
            color: Color(0xFFDDDDDD),
          ),
        );
      },*/
    );
  }
}
