# オブジェクトの steteProviderは 新しいインスタンスで更新

## 定義
```sh
StateProvider<ImmutableData>((ref) => ImmutableData(0));
```

## 購読
```sh
Consumer(builder: (context, ref, child) {
return Text(
'${ref.watch(_immutableProvider).count}',
style: Theme.of(context).textTheme.headline4,
);
}),
```

## 更新
```sh
// オブジェクトごと 交換しないと反応しない
final oldImmutableData = ref.read(_immutableProvider); 
final newImmutableData = oldImmutableData.countUp();
ref.read(_immutableProvider.notifier).state = newImmutableData;
```
