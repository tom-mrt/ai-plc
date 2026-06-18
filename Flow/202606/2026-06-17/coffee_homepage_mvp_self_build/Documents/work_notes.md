# 作業メモ: コーヒーホームページMVP自作

## 基本情報

- Scope ID: `L-0617`
- Scope: コーヒーホームページMVP自作
- 作成日: 2026-06-17
- 現在位置: Stage 4 Operation / T003完了
- 次の実行候補: `T004 Layout/Header/Footer作成`

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
| Stage 4 Operation | 進行中 | `T001`, `T002`, `T003` 完了 |

## Backlog

| ID | タスク | 状態 |
| --- | --- | --- |
| T001 | 開発環境と作業場所の確認 | completed |
| T002 | Astro最小プロジェクト作成 | completed |
| T003 | Tailwind CSS + daisyUI導入 | completed |
| T004 | Layout/Header/Footer作成 | pending |
| T005 | Coffee Log Content Collection設計 | pending |
| T006 | トップページMVP実装 | pending |
| T007 | Coffee Log一覧・詳細ページ実装 | pending |
| T008 | レスポンシブ確認・ビルド検証 | pending |
| T009 | GitHub/Cloudflare公開準備 | pending |

## 次に実行するプロンプト

`@SKL_plc_04_operation を実行してください Layer: @/Users/tomoyamorita/Projects/ai-plc/Flow/202606/2026-06-17/coffee_homepage_mvp_self_build Task: T004`

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

## 疑問・確認したいこと

- サイト名をどうするか。
- 作成先ディレクトリを `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee` のままでよいか。
- GitHub repository名を `meishi-coffee` のままでよいか。
- トップページの最初の文章をどうするか。
- Coffee Logの最初のサンプル記事を何にするか。
- T004ではT003で導入したdaisyUIの `card`, `badge`, `btn` などを使って、共通Layout/Header/Footerを作る。

## 外部操作ゲート

以下は明示承認があるまで実行しない。

- GitHub repository作成
- `git push`
- Cloudflare Pages接続
- 外部公開
- Cloudflare Web Analytics導入
- 独自ドメイン取得
- DNS設定
