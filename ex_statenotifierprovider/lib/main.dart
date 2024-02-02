import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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
      home: MyHomePage(title: 'StateNotifier'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  final _counterProvider =
  StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'StateNotifierのvoid関数によって stateが変えられる',
            ),
            Text(
              '${ref.watch(_counterProvider)}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(_counterProvider.notifier).countUp(), // notifierで定義した自作関数
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// StateNotifierは
// state :  StateNotifier<int>の状態を表す
// void  ： stateの更新関数であらわされる
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
  void countUp() {
    state++;
  }
}