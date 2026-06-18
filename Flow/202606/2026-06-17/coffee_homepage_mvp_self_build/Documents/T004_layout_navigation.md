# T004 Layout/Header/Footer作成

## 概要

T004では、全ページ共通で使う `Layout.astro`、`Header.astro`、`Footer.astro` を作成し、トップページに適用した。実装先はAI-PLC管理ディレクトリではなく、実際に動くAstroアプリである `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee`。

## 判断理由

後続のT006トップページMVP実装、T007 Coffee Log一覧・詳細ページ実装でページ数が増えるため、先に共通レイアウトを分離した。これにより、HTMLの基本構造、グローバルCSS読み込み、ヘッダー、フッター、メイン領域を各ページで重複実装せずに済む。

ナビゲーションはMVP範囲に合わせて `Top` と `Coffee Log` の2つだけに絞った。初期段階で項目を増やすと、未実装ページへの導線が増えてスコープが膨らむため。

## 変更内容

- `src/components/Layout.astro` を作成
  - `global.css` を読み込み
  - `Header`、`Footer`、`slot` を配置
  - ページごとに `title` を渡せるようにした
- `src/components/Header.astro` を作成
  - サイト名 `Meishi Coffee`
  - `/` への `Top` リンク
  - `/coffee/` への `Coffee Log` リンク
- `src/components/Footer.astro` を作成
  - 最小限の共通フッターを配置
- `src/pages/index.astro` を更新
  - ページ全体のHTMLを `Layout` に移動
  - トップページ本文だけを残す形に整理
  - Coffee Logへの導線を `a` リンクに変更

## 対象ファイル

- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/components/Layout.astro`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/components/Header.astro`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/components/Footer.astro`
- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/pages/index.astro`

## 受け入れ条件の確認

- `Layout.astro`, `Header.astro`, `Footer.astro` が作られている
  - `src/components/` 配下に3ファイルを作成済み
- トップページとCoffee Logへの導線がある
  - Headerに `/` と `/coffee/` へのリンクを配置済み
  - トップページのCTAにも `/coffee/` へのリンクを配置済み
- スマホ幅でもナビゲーションが破綻しない
  - daisyUIの `navbar` と小さめの `btn btn-ghost btn-sm` を使い、項目を2つに限定している

## 検証

実行した確認:

```zsh
docker compose run --rm web npm run build
```

結果:

- `npm run build` 成功
- `Layout.astro` 経由で `global.css`、Header、Footerを読み込める
- トップページは本文だけを持つ構成になり、後続ページでLayoutを再利用できる

## Phase 5.5: Verification（standard）

- [x] L1: `src/components/Layout.astro`, `src/components/Header.astro`, `src/components/Footer.astro`, `src/pages/index.astro` を確認し、T004の受け入れ条件を満たしている
- [x] L2: `npm run build` が成功し、後続T006/T007で同じLayoutを使ってページを追加できる状態になっている

## Phase 7: Propagation チェックリスト

- [x] backlog.yaml更新 — T004 status -> completed
- [x] context.yaml更新 — 成果物エントリ `T004 Layout Navigation` を追加
- [x] memory.md — project-local `memory.md` は存在しないため、更新なし
- [x] user.md — project-local `user.md` は存在しないため、更新なし
- [x] External Sync — `sync_targets` はNotion DBとして定義あり。ただしこのローカル更新ではNotion同期ツールを使っていないため未実行
- [x] Wiki波及更新 — `.notion/wiki/` が存在しないため、更新なし
- [x] log.md — Wiki更新なしのためスキップ

## 次のタスク

次は `T005 Coffee Log Content Collection設計`。T004で共通LayoutとCoffee Logへの導線ができたため、次は `/coffee/` の中身を支えるContent Collectionとサンプル記事を作る。
