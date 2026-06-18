# Beginner Learning Path

## Principle

学習と実装を分けすぎない。各ステップは「読む → 触る → 確認する」の小さいループにする。

## Recommended Order

1. Node.js / npm / Git の存在確認
2. Astroプロジェクトを作成してローカル起動
3. `src/pages/index.astro` を編集してトップページを最小表示
4. Tailwind CSS v4 を導入
5. daisyUI を導入し、カード・ボタン・ナビだけ使う
6. MDX統合を追加
7. `coffee-log` Content Collectionを作る
8. サンプル記事を1から3件作る
9. Coffee Log一覧ページを作る
10. Coffee Log詳細ページを作る
11. `npm run build` で静的ビルド確認
12. GitHubに置く前のREADMEと運用メモを作る
13. Cloudflare Pagesに接続する
14. 公開後にCloudflare Web Analyticsを検討する

## Learning Units

### Unit 1: Astroの基本

目的は「HTMLに近い書き方でページが作れる」ことを体感すること。

到達条件:
- `npm run dev` でローカル表示できる
- `src/pages/index.astro` の編集が画面に反映される
- `src/components/` に小さい部品を作れる

### Unit 2: Tailwind CSS and daisyUI

目的は「細かいCSSに沈まず、見た目を整える」こと。

到達条件:
- `@import "tailwindcss";` が読み込まれている
- daisyUIの `card`, `btn`, `badge`, `navbar` だけで最低限のUIを作れる
- テーマや色を増やしすぎない

### Unit 3: MDX and Content Collections

目的は「記事をファイルとして増やせる」こと。

到達条件:
- `src/content.config.ts` で `coffee-log` collectionを定義できる
- `.mdx` 記事にfrontmatterを書ける
- 一覧ページで記事を日付順に表示できる

### Unit 4: Deploy

目的は「名刺QRから見せられるURLを持つ」こと。

到達条件:
- `npm run build` が通る
- GitHubにpushできる状態になっている
- Cloudflare Pagesで `npm run build` / `dist` を設定する手順がわかる

## Beginner Guardrails

- 1日で全部作ろうとしない。
- 最初の完成形は写真や文章が少なくてよい。
- 画面が崩れたら、機能追加を止めてレイアウトだけ直す。
- 公式ドキュメントの導入手順と、手元のバージョンを混ぜない。
- CloudflareやGitHubで外部公開に進む前に、ローカルの `npm run build` を必ず通す。
