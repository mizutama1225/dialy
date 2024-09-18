# Dialy Project

## Getting Started

### インストール

リポジトリをクローンする

```bash
git clone git@github.com:mizutama1225/dialy.git --recursive
```

### 実行

フロントエンド、バックエンド、データベースのコンテナをまとめてビルド＆起動する。

```bash
docker compose up --build
```

<details>
<summary>ビルドまたは起動のみを行う</summary>

<br>

コンテナイメージのビルドのみ行う

```bash
docker compose build
```

コンテナイメージのビルドのみ行う(キャッシュを読み込まない)

```bash
docker compose build --no-cache
```

コンテナイメージの起動のみ行う

```bash
docker compose up
```

</details>

<br>

<details>
<summary>一部のコンテナのみ起動する</summary>

<br>

```bash
docker compose up 起動したいサービス名
```

(例) frontendのみ起動

```bash
docker compose up frontend
```

(例) backendとdatabseのみ起動

```bash
docker compose up frontend backend
```

</details>

<br>

<details>
<summary>コンテナ内でシェルを使う</summary>

<br>

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

</details>

<br>

フロントエンドへのアクセスは`localhost:5000`

バックエンドへのアクセスは`localhost:8000`

## Not Supported Features

* Flutterアプリのweb以外（android, ios）のテスト環境
