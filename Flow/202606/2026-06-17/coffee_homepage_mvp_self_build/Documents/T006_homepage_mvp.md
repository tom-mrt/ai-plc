# T006 トップページMVP実装

## 概要

T006では、名刺QRから見せる入口として、トップページMVPを実装した。実装先はAI-PLC管理ディレクトリではなく、実際に動くAstroアプリである `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee`。

## 判断理由

T004で共通Layout/Header/Footer、T005でCoffee Log Content Collectionが整っているため、T006ではトップページの構成と導線に集中した。最初からページ数や装飾を増やすと初学者向けMVPのスコープが膨らむため、トップページ上で「何のサイトか」「最近のおすすめ」「好きなお店」「最新Coffee Log」「一覧への導線」がわかる最小構成にした。

Coffee Logは `draft: true` を除外して取得する。下書き確認用の記事がトップページに出ると公開品質の判断がぶれるため、T005で決めた公開除外方針をT006でも維持した。

好きなお店3選は、現時点では静的な仮データにした。店舗データをContent Collection化するのは後続のスコープ膨張につながるため、MVPでは「枠がある」ことを優先し、具体的な店名は後から差し替えられる形にした。

## 変更内容

- `src/pages/index.astro` を更新
  - `getCollection("coffee-log")` で公開Coffee Logを取得
  - `draft: true` をトップページ表示から除外
  - 日付の新しい順に並び替え
  - 最新Coffee Logを最大3件表示
  - `recommended: true` のCoffee Logを最近のおすすめとして表示
  - 好きなお店3選の静的セクションを配置
  - `/coffee/` への導線を複数箇所に配置

## 対象ファイル

- `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee/src/pages/index.astro`

## 表示セクション

- サイト紹介
- 最近のおすすめ
- 好きなお店3選
- 最新Coffee Log
- Coffee Log一覧へのリンク

## 受け入れ条件の確認

- トップページにMVPの主要セクションが表示される
  - サイト紹介、最近のおすすめ、好きなお店3選、最新Coffee Logを配置済み
- Coffee Log一覧への導線がある
  - ヒーロー部分と最新Coffee Logセクションに `/coffee/` へのリンクを配置済み
- 文章量が少なくても未完成に見えにくい構成になっている
  - 「準備中」を並べる構成ではなく、仮データと既存Coffee Logを使って公開可能な密度にした

## 検証

実行した確認:

```zsh
docker compose run --rm web npm run build
```

結果:

- `npm run build` 成功
- Content Collectionsのsync成功
- `/index.html` の静的生成成功
- daisyUI 5.5.23 のCSS生成成功

## Phase 5.5: Verification（standard）

- [x] L1: `src/pages/index.astro` を確認し、T006の主要セクション、Coffee Log一覧導線、draft除外、最新Coffee Log表示ロジックが入っている
- [x] L2: `docker compose run --rm web npm run build` が成功し、T004のLayoutとT005のContent Collectionを組み合わせても静的ビルドが通る

## Phase 7: Propagation チェックリスト

- [x] backlog.yaml更新 — T006 status -> completed
- [x] context.yaml更新 — 成果物エントリ `T006 Homepage MVP` を追加
- [x] memory.md — project-local `memory.md` は存在しないため、更新なし
- [x] user.md — project-local `user.md` は存在しないため、更新なし
- [x] External Sync — `sync_targets` はNotion DBとして定義あり。ただしこのローカル更新ではNotion同期ツールを使っていないため未実行
- [x] Wiki波及更新 — `.notion/wiki/` が存在しないため、更新なし
- [x] log.md — Wiki更新なしのためスキップ
- [x] Project Registry DB — 未完了タスクありのため、completed更新はスキップ

## 次のタスク

次は `T007 Coffee Log一覧・詳細ページ実装`。T006でトップページから `/coffee/` への導線ができたため、次はリンク先であるCoffee Log一覧と詳細ページを実装する。
