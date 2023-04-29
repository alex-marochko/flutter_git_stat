import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async =>
        'Bearer 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',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});

  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 150,
              width: 200,
              child: Query(
                options: QueryOptions(
                  document: gql(
                      readRepositories), // this is the query string you just created
                  variables: {
                    'nRepositories': 50,
                  },
                  pollInterval: const Duration(seconds: 10),
                ),
                // Just like in apollo refetch() could be used to manually trigger a refetch
                // while fetchMore() can be used for pagination purpose
                builder: (QueryResult result,
                    {VoidCallback? refetch, FetchMore? fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return const Text('Loading');
                  }

                  List? repositories =
                      result.data?['viewer']?['repositories']?['nodes'];

                  if (repositories == null) {
                    return const Text('No repositories');
                  }

                  return ListView.builder(
                      itemCount: repositories.length,
                      itemBuilder: (context, index) {
                        final repository = repositories[index];

                        return Text(repository['name'] ?? '');
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
