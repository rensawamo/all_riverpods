# StateNotifierProvider

## 定義
```sh
class CounterNotifier extends StateNotifier<int> {
CounterNotifier() : super(0);
void countUp() {
state++;
}
}

final _counterProvider =
StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());
```


## 購読
```sh
Text(
'${ref.watch(_counterProvider)}',
style: Theme.of(context).textTheme.headline4,
),
```

## 更新
```sh
ref.read(_counterProvider.notifier).countUp(),
```
