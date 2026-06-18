# 作業メモ: コーヒーホームページMVP自作

## 基本情報

- Scope ID: `L-0617`
- Scope: コーヒーホームページMVP自作
- 作成日: 2026-06-17
- 現在位置: Stage 4 Operation / T006完了
- 次の実行候補: `T007 Coffee Log一覧・詳細ページ実装`

## 目的

ホームページ作成と関連技術スタックが初めての状態から、Astroを中心にしたコーヒー個人サイトMVPを自力で作れるようにする。

MVPは以下に絞る。

- トップページ
- Coffee Log一覧
- Coffee Log詳細

## 採用スタック

- Astro
- TypeScript
- MDX
- Astro Content Collections
- Tailwind CSS
- daisyUI
- GitHub
- Cloudflare Pages
- Cloudflare Web Analytics

## ここまでの決定

- Wix / STUDIO / Notion直公開系は主軸にしない。
- Next.jsは初期MVPでは採用しない。
- Headless CMS、DB、店舗マップ、検索、RSS、認証、管理画面、独自ドメインは後回し。
- 最初は無料サブドメインで公開し、独自ドメインはあとから検討する。
- GitHub repository作成、`git push`、Cloudflare Pages接続、外部公開は本人承認後にだけ実行する。

## AI-PLC進捗

| Stage | 状態 | 成果物 |
| --- | --- | --- |
| Stage 1 Collection | 完了 | `intent.yaml`, `context.yaml`, `Context/` |
| Stage 2 Inception | 完了 | `backlog.yaml`, `Context/06_inception_decisions.md` |
| Stage 3 Construction | 完了 | `Agents/` |
| Stage 4 Operation | 進行中 | `T001`, `T002`, `T003`, `T004`, `T005`, `T006` 完了 |

## Backlog

| ID | タスク | 状態 |
| --- | --- | --- |
| T001 | 開発環境と作業場所の確認 | completed |
| T002 | Astro最小プロジェクト作成 | completed |
| T003 | Tailwind CSS + daisyUI導入 | completed |
| T004 | Layout/Header/Footer作成 | completed |
| T005 | Coffee Log Content Collection設計 | completed |
| T006 | トップページMVP実装 | completed |
| T007 | Coffee Log一覧・詳細ページ実装 | pending |
| T008 | レスポンシブ確認・ビルド検証 | pending |
| T009 | GitHub/Cloudflare公開準備 | pending |

## 次に実行するプロンプト

`@SKL_plc_04_operation を実行してください Layer: @/Users/tomoyamorita/Projects/ai-plc/Flow/202606/2026-06-17/coffee_homepage_mvp_self_build Task: T007`

## 作業中メモ

### 2026-06-17

- AI-PLCでCollection、Inception、Constructionまで完了。
- 初心者向けに、単一Scope内の9タスクで進める方針にした。
- SubLayerは作らない。理由は、単一AstroサイトMVPでは再帰スコープに分けるより、依存順に進める方がわかりやすいため。
- Stage 4はT001から開始する。
- T001で Node.js `v22.22.2`、npm `10.9.7`、Apple Git `2.50.1` を確認済み。
- Docker `29.3.1`、Docker Compose `v5.1.1` を確認済み。
- T002の仮作業場所は `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee`。
- プロジェクト名とGitHub repository名の仮候補は `meishi-coffee`。
- ローカルPCを汚したくないため、T002はDocker前提に切り替えた。
- T002ではホストMacで `npm install` を直接実行せず、`node_modules` はDocker named volumeに置く。
- T002レビューで、`docker compose up` によるAstro dev server起動、`http://localhost:4321/` のHTML取得、`hello world` の編集反映を確認した。
- ホスト側 `node_modules` は0Bで、依存関係の実体はDocker named volume `meishi-coffee_node_modules` にあることを確認した。
- `npm audit` でhigh severityが3件出ている。T002はブロックしないが、T008/T009の公開前確認で再チェックする。
- コンテナ内に共有フォルダ的なものを作り、共有フォルダ内に成果物を残す。すると、ローカル側でも成果物を確認できる。
- ローカルpcを汚さないために、依存ライブラリはコンテナ内にのみ残す。

### 2026-06-18

- Docker内でTailwind CSS v4、`@tailwindcss/vite`、daisyUIをインストールする手順を確認した。
- `astro.config.mjs` にTailwind用のVite pluginを入れる方針を確認した。
- `global.css` でTailwind CSSとdaisyUIを読み込む方針を確認した。

### 2026-06-19

- T003レビューで、`package.json`、`astro.config.mjs`、`src/styles/global.css`、`src/pages/index.astro` が受け入れ条件を満たすことを確認した。
- `docker compose run --rm web npm run build` が成功し、buildログに `daisyUI 5.5.23` が出た。
- `docker compose up` でAstro dev serverが起動し、`/` が `200` 応答することを確認した。
- `npm audit --audit-level=high` は終了コード0。残りはlow severity 2件のため、T008/T009の公開前確認で再チェックする。
- T003をAI-PLC上も完了扱いに更新した。次はT004でLayout/Header/Footerを作る。
- astroのprops, slotの概念。reactに似ている。propsを定義すれば、外部から値を受け取れる。コンポーネントに引数を渡す。
- T004で `src/components/Layout.astro`, `Header.astro`, `Footer.astro` を作成した。
- `src/pages/index.astro` は共通Layoutを使い、本文だけを持つ構成に整理した。
- HeaderのナビはMVP範囲に合わせて `Top` と `Coffee Log` の2つに限定した。
- T004をAI-PLC上も完了扱いに更新した。次はT005でCoffee Log Content Collectionを設計する。
- T005で `@astrojs/mdx` を導入し、`src/content.config.ts` に `coffee-log` collectionを定義した。
- `src/content/coffee-log/home-drip-first.mdx` を公開サンプル、`draft-test.mdx` をdraft除外確認用として作成済み。
- T006/T007では `draft: true` の記事を `data.draft !== true` で除外する。
- `docker compose run --rm web npm run build` が成功し、Content Collectionsのsyncも通った。
- T005をAI-PLC上も完了扱いに更新した。次はT006でトップページMVPを実装する。
- スキーマ定義は重くしないほうがいいかも。まずは仮決めしておいて、必要になったら精緻化する程度。
- T006で `src/pages/index.astro` にサイト紹介、最近のおすすめ、好きなお店3選、最新Coffee Log、Coffee Log一覧への導線を実装した。
- T006では `draft: true` のCoffee Logを表示から除外し、公開サンプルだけがトップページに出る構成にした。
- `docker compose run --rm web npm run build` が成功し、トップページMVPはT004 LayoutとT005 Content Collectionを組み合わせても静的ビルドできることを確認した。
- T006をAI-PLC上も完了扱いに更新した。次はT007でCoffee Log一覧・詳細ページを実装する。

## 疑問・確認したいこと

- サイト名をどうするか。
- 作成先ディレクトリを `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee` のままでよいか。
- GitHub repository名を `meishi-coffee` のままでよいか。
- 好きなお店3選をいつ具体的な店名に差し替えるか。

## 外部操作ゲート

以下は明示承認があるまで実行しない。

- GitHub repository作成
- `git push`
- Cloudflare Pages接続
- 外部公開
- Cloudflare Web Analytics導入
- 独自ドメイン取得
- DNS設定
