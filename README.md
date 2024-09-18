# Dialy Project

## Getting Started

リポジトリをクローンする

```bash
git clone git@github.com:mizutama1225/dialy.git --recursive
```

フロントエンド、バックエンド、データベースをまとめて起動する。

```bash
docker compose up --build
```

フロントエンドのコンテナに入る

```bash
docker compose exec frontend bash
```

バックエンドのコンテナに入る

```bash
docker compose exec backend bash
```

データベースのコンテナに入る

```bash
docker compose exec db bash
```

フロントエンドへのアクセスは`localhost:5000`

バックエンドへのアクセスは`localhost:8000`

## Not Supported Features

* Flutterアプリのweb以外（android, ios）のテスト環境
