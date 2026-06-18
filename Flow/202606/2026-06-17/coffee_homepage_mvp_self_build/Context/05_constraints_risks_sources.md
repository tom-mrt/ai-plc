# Constraints, Risks, and Sources

## Constraints

- 初学者が自力で作ることを優先する。
- 2から4週間程度で公開できる粒度にする。
- まずは無料から月数百円程度で運用する。
- 最初は無料サブドメインで公開し、独自ドメインは後回しにする。
- 外部公開やGitHub/Cloudflare連携は本人承認後に進める。

## Risks

### Learning Overload

Astro、TypeScript、MDX、Tailwind、daisyUI、GitHub、Cloudflareを同時に学ぶと詰まりやすい。

Mitigation:
- 1ステップごとに画面確認する。
- `npm run dev` と `npm run build` を検証ゲートにする。
- まず動くものを作り、あとから整える。

### Tooling Version Drift

Tailwind CSS v4、daisyUI v5、AstroのCloudflare周辺は変化が速い。

Mitigation:
- 実装直前に公式ドキュメントを再確認する。
- 古いTailwind v3系の記事を混ぜない。
- `astro.config.mjs` とCSS導入方法を現在の公式手順に合わせる。

### Scope Creep

店舗マップ、検索、RSS、CMS、独自ドメインを初期に入れるとMVPが重くなる。

Mitigation:
- MVPはトップ + Coffee Logに固定する。
- 後回し機能はStage 2でBacklogに分ける。

### Public Quality

名刺QRから見られるサイトなので、壊れたUIや未完成感が強い画面は避ける。

Mitigation:
- 最初の公開前にスマホ幅とデスクトップ幅を確認する。
- 文章量が少なくても、ナビゲーションとカードの見た目を整える。
- `draft: true` の記事は一覧に出さない。

## Verification Plan

### L1: Section Check

- `intent.yaml`, `context.yaml`, `backlog.yaml` が存在する。
- Context Storeに、Goal、学習順、技術スタック、プロダクトスコープ、リスクが分かれている。
- 公式ドキュメントのリンクが記録されている。

### L2: Integration Check

- intentのsuccess criteriaとContext Storeの内容が矛盾していない。
- MVPの範囲と後回し項目が一致している。
- Stage 2でタスク化できる粒度のseed themesがある。

## Source Index

- ChatGPT conversation checked via Chrome on 2026-06-17: 技術選定とMVP方向性
- Astro Why Astro: https://docs.astro.build/en/concepts/why-astro/
- Astro Content Collections: https://docs.astro.build/en/guides/content-collections/
- Astro MDX integration: https://docs.astro.build/en/guides/integrations-guide/mdx/
- Tailwind CSS Astro guide: https://tailwindcss.com/docs/installation/framework-guides/astro
- daisyUI Astro guide: https://daisyui.com/docs/install/astro/
- Cloudflare Pages Astro guide: https://developers.cloudflare.com/pages/framework-guides/deploy-an-astro-site/
- Cloudflare Pages limits: https://developers.cloudflare.com/pages/platform/limits/
- Cloudflare Web Analytics: https://developers.cloudflare.com/web-analytics/
