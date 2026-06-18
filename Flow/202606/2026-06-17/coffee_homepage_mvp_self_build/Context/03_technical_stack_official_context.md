# Technical Stack Official Context

## Stack Decision

MVPの第一候補は以下。

- Astro
- TypeScript
- MDX
- Astro Content Collections
- Tailwind CSS v4
- daisyUI
- GitHub
- Cloudflare Pages
- Cloudflare Web Analytics

## Astro

Astro公式は、Astroをブログ、マーケティング、e-commerceなどのcontent-driven websites向けフレームワークとして説明している。今回のサイトはログ、写真、文章が中心なので、アプリケーション寄りのNext.jsよりMVP向き。

Source: https://docs.astro.build/en/concepts/why-astro/

Relevant official facts:
- Astro is for content-driven websites.
- Astro reduces client-side JavaScript overhead.
- Content collections provide organization, validation, and TypeScript type-safety for Markdown content.

## Content Collections

Coffee Logは `src/content/coffee-log/` にMDXファイルを置き、`src/content.config.ts` でschemaを定義するのが自然。

Source: https://docs.astro.build/en/guides/content-collections/

MVPで使うfrontmatter候補:

```yaml
title: "今日の一杯"
date: 2026-06-17
place: "自宅"
brew_method: "ハンドドリップ"
roaster: "未定"
tags:
  - coffee-log
recommended: false
draft: false
```

## MDX

MDXは `@astrojs/mdx` integrationで導入できる。普通のMarkdownとして書きつつ、将来は `CoffeeCard` や `ShopCard` のようなコンポーネントを記事中に差し込める。

Source: https://docs.astro.build/en/guides/integrations-guide/mdx/

## Tailwind CSS v4

Tailwind公式のAstro導入手順は、`tailwindcss` と `@tailwindcss/vite` を入れ、Astro configのVite pluginsに `tailwindcss()` を追加し、CSSに `@import "tailwindcss";` を書く流れ。

Source: https://tailwindcss.com/docs/installation/framework-guides/astro

## daisyUI

daisyUI公式のAstro導入手順は、Tailwind CSSとdaisyUIを入れ、CSSに `@import "tailwindcss";` と `@plugin "daisyui";` を書く流れ。MVPでは `card`, `button`, `badge`, `navbar`, `footer` 程度に限定して使う。

Source: https://daisyui.com/docs/install/astro/

## Cloudflare Pages

Cloudflare公式のAstroガイドでは、GitHub repositoryをCloudflare Pagesに接続し、Production branchを `main`、Build commandを `npm run build`、Build directoryを `dist` にする手順が案内されている。pushごとに自動build/deployされる。

Source: https://developers.cloudflare.com/pages/framework-guides/deploy-an-astro-site/

Cloudflare PagesのFree planでは、公式Limitsページ上で月500 builds、1 build at a time、100 custom domains per Pages project、20,000 files per siteなどが示されている。個人MVPには十分。

Source: https://developers.cloudflare.com/pages/platform/limits/

## Cloudflare Web Analytics

名刺QRサイトの初期分析は高度なイベント計測より、ページ閲覧とざっくりした利用状況で足りる。Cloudflare Web AnalyticsはCloudflare公式のWeb Analytics機能として、Pages公開後に導入候補にする。

Source: https://developers.cloudflare.com/web-analytics/

## Current Technical Caution

AstroとCloudflare周辺は更新が速い。実装時は、このContextの記録を前提にしつつ、実際に使う直前に公式ドキュメントの導入コマンドを再確認する。
