import 'package:flutter/material.dart';
import 'package:git_stat/app/view/app_page.dart';

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
        useMaterial3: true,
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
