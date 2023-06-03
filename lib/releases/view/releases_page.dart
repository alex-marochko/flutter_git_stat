import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/core/view/repository_page.dart';
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
        // TODO implement or change back to BlocBuilder
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
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RepositoryPage(repository: state.repos[i]),
                    ));
              },
              key: PageStorageKey(state.repos[i].id),
              leading: Hero(
                tag: 'ownerAvatar ${state.repos[i].id}',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(state.repos[i].ownerAvatarUrl),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'name ${state.repos[i].id}',
                    child: Text(
                      state.repos[i].name,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Hero(
                    tag: 'ownerName ${state.repos[i].id}',
                    child: Text(
                      state.repos[i].ownerName,
                      style: Theme.of(context).textTheme.bodySmall,
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'description ${state.repos[i].id}',
                    child: Text(
                      state.repos[i].description ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey),
                      // style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  ...?releasesInfo(context, state.repos[i]),
                ],
              ),
              trailing: Column(
                children: [
                  Hero(
                    tag: 'stars ${state.repos[i].id}',
                    child: Text(
                      '⭐${state.repos[i].stargazersCount}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  ...trailingDateAndStatus(context, state.repos[i]),
                ],
              ),
            ),
          );
        });
  }
}

List<Widget> trailingDateAndStatus(
    BuildContext context, ReleasedRepository repo) {
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
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    ),
    Text(
      hasReleases ? 'update' : 'new',
      // style: TextStyle(
      //     fontSize: 12, color: hasReleases ? Colors.grey : Colors.blue),
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: hasReleases ? Colors.grey : Colors.blue),
      textAlign: TextAlign.center,
    ),
  ];
}

List<Widget>? releasesInfo(BuildContext context, ReleasedRepository repo) {
  return repo.releases
      .expand((r) => [
            const SizedBox(height: 8),
            Text(
              '${r.name} - ${r.description.replaceAll(RegExp(r"\s+"), ' ').trim()}',
              overflow: TextOverflow.fade,
              maxLines: 3,
              style: const TextStyle(color: Colors.grey),
            )
          ])
      .toList();
}
