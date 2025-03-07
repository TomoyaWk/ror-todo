# Rails アプリケーション

このRailsアプリケーションはGitHub Copilotを活用して開発されています。

## 開発環境

* Ruby 3.2.2
* Rails 7.0.x
* SQLite3
* Docker & Docker Compose

## Dockerでの起動方法

1. コンテナのビルド:
```bash
docker-compose build
```

2. アプリケーションの起動:
```bash
docker-compose up
```

3. データベースの作成:
```bash
docker-compose run web rails db:create db:migrate
```

4. アプリケーションへのアクセス:
ブラウザで http://localhost:3000 を開いてください

## GitHub Copilotについて

本プロジェクトでは、以下の目的でGitHub Copilotを使用しています：
- コード生成の効率化
- ベストプラクティスの提案
- ドキュメント作成支援
- テストコードの作成支援

## システム構成

* 必要なシステム依存関係
  - Docker
  - Docker Compose
  - Git

* データベース構成
  - 開発環境：SQLite3
  - データベースファイル：`db/development.sqlite3`
  - 設定ファイル：`config/database.yml`

## テスト実行

テストスイートの実行方法：
```bash
docker-compose run web rails test
```

## デプロイ方法

Dockerコンテナを使用したデプロイが可能です。
本番環境にはDockerとDocker Composeのインストールが必要です。

## トラブルシューティング

問題が発生した場合は以下の手順を試してください：
1. Dockerコンテナの再起動
2. データベースの再作成
3. `tmp/cache`の削除
