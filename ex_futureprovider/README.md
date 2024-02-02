# FutureProvieder
Future型を取り扱うProvider。データと取得状態を管理するAsyncValueを取得。
WebAPIやSharedPreferences(key-value-簡易db)など非同期処理で取得されるデータに対して使用

## 定義
final _futureProvider = FutureProvider((ref) async {
final sharedPreferences = await SharedPreferences.getInstance();
return sharedPreferences.getInt(kKey) ?? 0;
});

## 購読(asyncによって非同期での取得)
ref.watch(_futureProvider).when(
loading: () => const CircularProgressIndicator(),
error: (error, stack) => const Text('error'),
data: (data) => Text(
'${ref.watch(_futureProvider).value}',
style: Theme.of(context).textTheme.headline4,
),
)

## viewの再リロード
ref.invalidate(_futureProvider)