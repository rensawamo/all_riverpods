# Riverpodを扱う widget

## Consumer
```sh
Consumer(builder: (context, ref, child) {
  return Text(
    '${ref.watch(_counterProvider)}',
    style: Theme.of(context).textTheme.headline4,
  );
}),
```


## ConsumerWidget
widgetの定義時に購読できるように
```sh
class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  final _counterProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        (中略)
    }
}
```

## ConsumerStatefulWidget
build widget の中で値の変更を行うための refを発行する
```sh
class MyHomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final _counterProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(_counterProvider.notifier).update((state) => state + 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
```
