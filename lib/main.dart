import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/app/view/app_page.dart';
import 'package:git_stat/my_repos/presenter/my_repos_cubit.dart';
import 'package:git_stat/my_repos/view/my_repos_page.dart';

// import 'package:graphql/client.dart';

void main() async {
  runApp(
    const MyApp(/*client: client*/),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    /*required this.client*/
  });

  // final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GitStat',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AppPage(),
    );
    // return GraphQLProvider(
    //   client: client,
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String readRepositories = """
  query ReadRepositories(\$nRepositories: Int!) {
    viewer {
      repositories(last: \$nRepositories) {
        nodes {
          id
          name
          viewerHasStarred
        }
      }
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const MyReposPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<MyReposCubit>().fetchMyRepos(),
        tooltip: 'Get repositories',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
