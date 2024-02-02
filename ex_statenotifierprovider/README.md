# StateNotifierProvider

## 定義
class CounterNotifier extends StateNotifier<int> {
CounterNotifier() : super(0);
void countUp() {
state++;
}
}

final _counterProvider =
StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

## 購読
Text(
'${ref.watch(_counterProvider)}',
style: Theme.of(context).textTheme.headline4,
),

## 更新
ref.read(_counterProvider.notifier).countUp(),