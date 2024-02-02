# StreamProvider
widgetでviewの分岐が可能

StreamControllerやFirestoreのスナップショットなどのストリームで提供されるデータに対して使用

## 定義
```sh
final _streamController = StreamController<int>();
late final _streamProvider = StreamProvider<int>((ref) {
return _streamController.stream;
});
```

## 購読
```sh
ref.watch(_streamProvider).when(
loading: () => const CircularProgressIndicator(),
error: (error, stack) => const Text('error'),
data: (data) => Text(
'${ref.watch(_streamProvider).value}',
style: Theme.of(context).textTheme.headline4,
),
),
```

## 更新
```sh
_streamController.sink.add(++_count)
```