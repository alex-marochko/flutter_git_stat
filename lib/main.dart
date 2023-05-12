import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_stat/chart/presenter/chart_cubit.dart';

import 'chart/view/chart_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ChartCubit>(
        create: (_) => ChartCubit(),
        child: const ChartPage(),
      ),
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
  int _counter = 0;

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const ChartPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ChartCubit>().fetchMyRepos(),
        tooltip: 'Get repositories',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
