# T002 Docker版 Astro最小プロジェクト作成ガイド

## 方針

ローカルMacをできるだけ汚さないため、Node.js / npm の実行はDockerコンテナ内で行う。

ホストMacに残るもの:

- Astroプロジェクトのソースコード
- `package.json`
- `package-lock.json`
- `compose.yaml`

Docker側に閉じ込めるもの:

- npm実行環境
- `node_modules`
- npmで取得される依存パッケージ本体

## 確認済みDocker環境

| コマンド | 結果 | 判定 |
| --- | --- | --- |
| `docker --version` | `Docker version 29.3.1, build c2be9cc` | OK |
| `docker compose version` | `Docker Compose version v5.1.1` | OK |

## 作業場所

```text
/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee
```

## Step 1: 作業用フォルダへ移動

```bash
cd /Users/tomoyamorita/Projects/ai-plc
mkdir -p workspaces
cd workspaces
```

## Step 2: Docker上でAstro作成ウィザードを起動

```bash
docker run --rm -it \
  -v "$PWD":/workspace \
  -w /workspace \
  node:22-bookworm \
  npm create astro@latest ./meishi-coffee
```

ウィザードの回答:

```text
How would you like to start your new project?
> Empty

Install dependencies?
> No

Initialize a new git repository?
> No
```

TypeScriptを聞かれた場合:

```text
Use TypeScript?
> Yes

How strict should TypeScript be?
> Strict
```

## Step 3: プロジェクトへ移動

```bash
cd meishi-coffee
```

## Step 4: compose.yamlを作成

プロジェクト直下に `compose.yaml` を作成する。

```yaml
services:
  web:
    image: node:22-bookworm
    working_dir: /app
    volumes:
      - .:/app
      - node_modules:/app/node_modules
    ports:
      - "4321:4321"
    command: sh -c "npm install && npm run dev -- --host 0.0.0.0"

volumes:
  node_modules:
```

ポイント:

- `.:/app` でソースコードだけをコンテナに見せる。
- `node_modules:/app/node_modules` で依存パッケージ本体をDocker volumeに置く。
- `--host 0.0.0.0` を付けないと、Mac側ブラウザからdev serverを見られないことがある。

## Step 5: Docker Composeで起動

```bash
docker compose up
```

ブラウザで開く:

```text
http://localhost:4321/
```

停止するとき:

```text
control + c
```

バックグラウンド起動した場合の停止:

```bash
docker compose down
```

## Step 6: index.astroを少しだけ編集

`src/pages/index.astro` を開き、表示テキストを少し変える。

例:

```astro
<h1>Meishi Coffee</h1>
<p>名刺の裏に置く、コーヒーの小さなログ。</p>
```

ブラウザで表示が変わればT002の実作業は完了。

## 完了チェック

- [ ] `workspaces/meishi-coffee` が作成されている
- [ ] `compose.yaml` がある
- [ ] `docker compose up` が起動する
- [ ] `http://localhost:4321/` でAstro初期ページが見える
- [ ] `src/pages/index.astro` の編集がブラウザに反映される
- [ ] ホスト側に `node_modules/` ができていない

## よくあるエラー

### `Cannot connect to the Docker daemon`

Docker Desktopが起動していない可能性がある。Docker Desktopを起動してから再実行する。

### `port is already allocated`

`4321` 番ポートが既に使われている。

対処:

```bash
docker compose down
```

それでも解決しない場合は、`compose.yaml` の左側だけ変更する。

```yaml
ports:
  - "4322:4321"
```

この場合、ブラウザは以下を開く。

```text
http://localhost:4322/
```

### `node_modules` がホスト側にできた

`compose.yaml` の以下が抜けている可能性がある。

```yaml
volumes:
  - .:/app
  - node_modules:/app/node_modules
```

不要なら削除してよい。

```bash
rm -rf node_modules
```

## 片付け

コンテナを止める:

```bash
docker compose down
```

依存パッケージ用volumeも消す:

```bash
docker compose down -v
```

Docker imageも消す場合:

```bash
docker image rm node:22-bookworm
```

ただし、次回またpullが必要になる。
