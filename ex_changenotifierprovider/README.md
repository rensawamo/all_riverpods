# ChangeNotifier(非推奨)

## 定義
```sh
class Counter extends ChangeNotifier {
int _counter = 0;
get counter => _counter;

void countUp() {
_counter++;
notifyListeners();
}
}
final _counterProvider = ChangeNotifierProvider((ref) => Counter());
```

## 購読
```sh
Text(
'${ref.watch(_counterProvider).counter}',
style: Theme.of(context).textTheme,
),
```

## 更新
```sh
ref.read(_counterProvider).countUp()
```
