# flutter_firebase_auth

flutter + firebase-auth のサンプルプロジェクト

## 注意すべき点

### iOS

- firebase console からダウンロードできる GoogleService-Info.plist をプロジェクト配下に含める必要がある
  - これらは Firebase 用の設定ファイル
  - `info.plist` に情報を追記する必要もある
  - 環境変数の使い分けについては [FlutterでDart-defineのみを使って開発環境と本番環境を分ける](https://zenn.dev/riscait/articles/separating-environments-in-flutter) などが参考になる

### Android
- firebase console からダウンロードできる google-services.json をプロジェクト配下に含める必要がある
- また、`android/app/build.gradle` を編集する必要がある。
- さらに、firebase console 上で gradle の証明書情報を加える必要がある
  - 参考: [Google認証でApiException: 10が返却されたら、フィンガープリント不足かも？](https://riscait.medium.com/apiexception-10-error-in-sign-in-with-google-using-firebase-auth-in-flutter-1be6a44a2086)

## 追加している機能

### Health

- [health](https://pub.dev/packages/health) パッケージの説明順の作業を実行する必要がある