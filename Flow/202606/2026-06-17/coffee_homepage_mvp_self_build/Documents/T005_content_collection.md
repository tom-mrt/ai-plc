# T005 Coffee Log Content Collection設計

## 概要

T005では、Coffee LogをAstro Content Collectionsで管理できるようにした。実装先はAI-PLC管理ディレクトリではなく、実際に動くAstroアプリである `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee`。

## 判断理由

後続のT006トップページMVP、T007 Coffee Log一覧・詳細ページでは、記事タイトル、日付、抽出方法、タグ、本文を同じ形式で取得する必要がある。そのため、ページを作る前に `coffee-log` collectionを定義し、MDX記事を型付きデータとして読める状態にした。

schemaは初期MVP向けに最小限にした。画像、評価点、店舗マップ用の詳細データなどは、T006/T007の実装を複雑にするためまだ入れていない。一方、一覧表示で必要になる短い説明文として `excerpt` は追加した。

## 変更内容

- `@astrojs/mdx` を導入
  - `package.json` に依存関係が追加されている
  - `astro.config.mjs` に `integrations: [mdx()]` が追加されている
- `src/content.config.ts` を作成
  - `coffee-log` collectionを定義
  - `glob({ base: "./src/content/coffee-log", pattern: "**/*.{md,mdx}" })` でMD/MDXを読み込む
  - frontmatter schemaを `z.object(...)` で定義
- `src/content/coffee-log/home-drip-first.mdx` を作成
  - `draft: false`
  - `recommended: true`
  - T006/T007で表示に使える公開サンプル
- `src/content/coffee-log/draft-test.mdx` を作成
  - `draft: true`
  - T007で公開一覧から除外する挙動の確認用

## 対象ファイル

- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/package.json`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/package-lock.json`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/astro.config.mjs`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/content.config.ts`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/content/coffee-log/home-drip-first.mdx`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/content/coffee-log/draft-test.mdx`

## Coffee Log schema

現在のfrontmatterは以下を前提にする。

```ts
{
  title: string;
  date: Date;
  place?: string;
  brew_method?: string;
  roaster?: string;
  excerpt: string;
  tags: string[];
  recommended: boolean;
  draft: boolean;
}
```

## draft除外方針

`draft: true` の記事は、公開一覧と本番ビルドで読者向けに出さない。T007で一覧を実装するときは、以下の条件で除外する。

```ts
const entries = await getCollection("coffee-log", ({ data }) => {
  return data.draft !== true;
});
```

T006のトップページで「最新Coffee Log」や「おすすめ」を出す場合も、同じく `draft: true` は除外する。

## 受け入れ条件の確認

- `src/content.config.ts` に `coffee-log` collectionが定義されている
  - `defineCollection()` と `glob()` loaderで定義済み
- サンプルMDX記事が1件以上ある
  - 公開サンプル `home-drip-first.mdx` とdraft確認用 `draft-test.mdx` がある
- `draft: true` を公開一覧から除外できる設計になっている
  - schemaに `draft` を持たせ、T006/T007では `data.draft !== true` で除外する方針にした

## 検証

実行した確認:

```zsh
docker compose run --rm web npm run build
```

結果:

- `npm run build` 成功
- build中にContent Collectionsのsyncが成功
- MDX integrationが読み込まれ、既存トップページのstatic buildも成功

## Phase 5.5: Verification（standard）

- [x] L1: `src/content.config.ts`、2件のMDX frontmatter、`astro.config.mjs`、`package.json` を確認し、T005の受け入れ条件を満たしている
- [x] L2: `docker compose run --rm web npm run build` が成功し、T006/T007から `coffee-log` collectionを取得できる前提が整っている

## Phase 7: Propagation チェックリスト

- [x] backlog.yaml更新 — T005 status -> completed
- [x] context.yaml更新 — 成果物エントリ `T005 Content Collection` を追加
- [x] memory.md — project-local `memory.md` は存在しないため、更新なし
- [x] user.md — project-local `user.md` は存在しないため、更新なし
- [x] External Sync — `sync_targets` はNotion DBとして定義あり。ただし既存T005行を安全に特定するクエリ手段を使っていないため、重複作成を避けて未実行
- [x] Wiki波及更新 — `.notion/wiki/` が存在しないため、更新なし
- [x] log.md — Wiki更新なしのためスキップ
- [x] Project Registry DB — 未完了タスクありのため、completed更新はスキップ

## 次のタスク

次は `T006 トップページMVP実装`。T004で共通Layout、T005でCoffee Log collectionが揃ったため、トップページで最新Coffee Logやおすすめコーヒーを表示できる。
