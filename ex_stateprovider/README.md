# StateProvider 

## 定義
```sh
final _counterProvider = StateProvider((ref) => 0);
```

## 購読
```sh
ref.watch(_counterProvider)
```

## 更新
```sh
ref.read(_counterProvider.notifier).update((state) => state + 1);
ref.read(_counterProvider.notifier).state = 0;
```
