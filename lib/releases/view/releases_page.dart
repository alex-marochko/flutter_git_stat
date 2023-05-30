import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/releases/model/released_repository.dart';
import 'package:git_stat/releases/presenter/releases_cubit.dart';
import 'package:intl/intl.dart';

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
      child: BlocConsumer<ReleasesCubit, ReleasesState>(
          listener: (context, state) {
        // TODO implement
      }, builder: (context, state) {
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
          return Card(
            child: ListTile(
              key: PageStorageKey(state.repos[i].id),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(state.repos[i].ownerAvatarUrl),
              ),
              title: Text(
                state.repos[i].nameWithOwner,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.repos[i].description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    // style: const TextStyle(color: Colors.grey),
                  ),
                  ...?releasesInfo(state.repos[i]),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    '⭐${state.repos[i].stargazersCount}',
                    textAlign: TextAlign.center,
                  ),
                  ...trailingDateAndStatus(state.repos[i]),
                ],
              ),
            ),
          );
        });
  }
}

List<Widget> trailingDateAndStatus(ReleasedRepository repo) {
  final hasReleases = repo.releases.isNotEmpty;

  DateTime lastUpdate;

  if (hasReleases) {
    final lastUpdateMs = repo.releases
        .map((e) => e.createdAt.millisecondsSinceEpoch)
        .reduce((value, element) => max(value, element));
    lastUpdate = DateTime.fromMillisecondsSinceEpoch(lastUpdateMs);
  } else {
    lastUpdate = repo.createdAt;
  }
  return [
    Text(
      DateFormat.yMMMd().format(lastUpdate),
      style: const TextStyle(fontSize: 12, color: Colors.grey),
      textAlign: TextAlign.center,
    ),
    Text(
      hasReleases ? 'update' : 'new',
      style: TextStyle(
          fontSize: 12, color: hasReleases ? Colors.grey : Colors.blue),
      textAlign: TextAlign.center,
    ),
  ];
}

List<Widget>? releasesInfo(ReleasedRepository repo) {
  return repo.releases
      .expand((r) => [
            const SizedBox(height: 8),
            Text(
              '${r.name} - ${r.description.replaceAll(RegExp(r"\s+"), ' ').trim()}',
              maxLines: 3,
              overflow: TextOverflow.fade,
              style: const TextStyle(color: Colors.grey),
            )
          ])
      .toList();
}
