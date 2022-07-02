# flutter_firebase_auth

flutter + firebase-auth のサンプルプロジェクト

## 注意すべき点

- iOS であれば、GoogleService-Info.plist, Android であれば、google-services.json をプロジェクト配下に含める必要がある
  - これらは Firebase 用の設定ファイル
  - また、iOS については、 `info.plist` に情報を追記する必要もある
  - 環境変数の使い分けについては [FlutterでDart-defineのみを使って開発環境と本番環境を分ける](https://zenn.dev/riscait/articles/separating-environments-in-flutter) などが参考になる
