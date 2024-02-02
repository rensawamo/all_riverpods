import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

void main() {
  print('start');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  int _counter = 1;

  // widgetがbuildされた後によばれる
  final _apiProvider =
  FutureProvider.autoDispose.family<String, int>((ref, page) async {
    print('provider was initialized (page=$page)');
    ref.onDispose(() => print('provider was disposed (page=$page)'));
    ref.onCancel(() => print('provider was canceled (page=$page)'));
    ref.onResume(() => print('provider was resumed (page=$page)'));

    String url =
        'https://api.github.com/search/repositories?q=flutter&page=$page';

    final client = http.Client();
    final response = await client.get(Uri.parse(url));
    final data = json.decode(response.body);
    final projectName = data['items'][0]['name'];
    return projectName;
  });

  // invalidateを使って widget内のstate変数のメモリをのこしたまま
  // 再リロードがかけられる
  void _incrementCounter(WidgetRef ref) {
    _counter++;
    ref.invalidate(_apiProvider);
    // cansele と dispose が呼ばれる  // autodisposeによって自動的にまえの provderを削除しないとメモリリークする(アップデートで必須ではなくなった？)
    //
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ConsumerWidget was build');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ref.watch(_apiProvider(_counter)).when(
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => const Text('error'),
              data: (data) => Text(data),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(ref),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}