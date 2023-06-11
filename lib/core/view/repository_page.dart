import 'package:flutter/material.dart';
import 'package:git_stat/releases/model/released_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryPage extends StatelessWidget {
  const RepositoryPage({Key? key, required this.repository}) : super(key: key);

  final ReleasedRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                tooltip: 'Open in browser',
                onPressed: () async {
                  final Uri url = Uri.parse(repository.url);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                icon: Image.asset('assets/github_mark.png')),
          ],
          title: Hero(
            tag: 'name ${repository.id}',
            child: Text(
              repository.name,
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 2,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: 'ownerAvatar ${repository.id}',
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(repository.ownerAvatarUrl),
                      ),
                    ),
                    Hero(
                        tag: 'ownerName ${repository.id}',
                        child: Text(
                          '  ${repository.ownerName}',
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    Hero(
                      tag: 'stars ${repository.id}',
                      child: Text(
                        '⭐${repository.stargazersCount}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Hero(
                  tag: 'description ${repository.id}',
                  child: Text(
                    repository.description ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                if (repository.releases.isNotEmpty)
                  Card(
                    margin: EdgeInsets.zero.copyWith(top: 16, bottom: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      children: repository.releases
                          .map(
                            (e) => ListTile(
                              title: Text(e.name),
                              subtitle: Text(e.description),
                            ),
                          )
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
