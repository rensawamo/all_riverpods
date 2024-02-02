# StateProvider 

## 定義
final _counterProvider = StateProvider((ref) => 0);

## 購読
ref.watch(_counterProvider)

## 更新
ref.read(_counterProvider.notifier).update((state) => state + 1);
ref.read(_counterProvider.notifier).state = 0;