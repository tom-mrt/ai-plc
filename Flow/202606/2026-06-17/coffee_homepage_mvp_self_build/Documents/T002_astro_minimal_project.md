# T002: Astro最小プロジェクト作成 レビュー結果

## 結論

T002は完了扱いでよい。

理由は、Docker前提のAstroプロジェクトが作成され、`docker compose up` で `http://localhost:4321/` に到達でき、`src/pages/index.astro` の編集内容がHTMLに反映されていることを確認できたため。

## 確認した成果物

- Project path: `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee`
- Compose file: `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/compose.yaml`
- Entry page: `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/pages/index.astro`
- Package file: `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/package.json`

## 検証結果

| 項目 | 結果 | メモ |
| --- | --- | --- |
| Astroプロジェクト作成 | OK | `package.json`, `astro.config.mjs`, `src/pages/index.astro` が存在 |
| Docker Compose設定 | OK | `node:22-bookworm`、`4321:4321`、named volume `node_modules` を確認 |
| ローカル表示 | OK | `curl http://localhost:4321/` でHTML取得成功 |
| ページ編集反映 | OK | `index.astro` の `hello world` がHTMLに反映 |
| ホスト依存の隔離 | OK | ホスト側 `node_modules` は0B、実体はDocker volume側に存在 |
| Docker内依存関係 | OK | コンテナ内で `node_modules/astro` が存在 |

## 実行確認メモ

```text
docker compose ps
=> meishi-coffee-web-1 Up, 0.0.0.0:4321->4321/tcp

curl http://localhost:4321/
=> <h1>Astro</h1> と <h2>hello world</h2> を含むHTMLを取得

docker compose exec -T web sh -c 'node -v && npm -v'
=> Node v22.22.3 / npm 10.9.8

docker compose exec -T web sh -c 'du -sh node_modules'
=> 139M

du -sh ./node_modules
=> 0B
```

## レビュー所見

### P2: `npm audit` でhigh severityが出ている

`npm audit --audit-level=high` の結果、`esbuild` / `vite` / `astro` 経由で3件のhigh severityが報告された。

現時点ではT002の完了をブロックしない。理由は、このタスクの目的が「Docker上でAstro最小プロジェクトを起動し、編集反映を確認すること」であり、公開前の本格検証はT008/T009に含まれているため。

ただし、外部公開前には再確認する。`npm audit fix --force` はAstroを大きく巻き戻す可能性があるため、この段階では実行しない。

## 次タスクへの引き継ぎ

T003では、このDocker環境の中でTailwind CSS + daisyUIを導入する。ホストMacで `npm install` は実行せず、依存追加は以下のようにDocker経由で行う。

```bash
docker compose exec web npm install tailwindcss @tailwindcss/vite daisyui
```

必要に応じて、`docker compose up` は起動したまま進めてよい。
