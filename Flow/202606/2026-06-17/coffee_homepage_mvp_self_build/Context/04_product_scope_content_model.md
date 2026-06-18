# Product Scope and Content Model

## MVP Pages

```text
/
  Top page

/coffee/
  Coffee Log list

/coffee/[slug]/
  Coffee Log detail
```

## Top Page Sections

1. Site title and short introduction
2. Recently recommended coffee
3. Favorite shops 3 selections
4. Latest Coffee Log 3 entries
5. Link to Coffee Log list

## Coffee Log List

最低限の表示項目:

- title
- date
- place
- brew_method
- tags
- short excerpt

## Coffee Log Detail

最低限の表示項目:

- title
- date
- place
- brew_method
- roaster
- body content from MDX
- back link to `/coffee/`

## Initial Directory Shape

```text
meishi-coffee/
├─ src/
│  ├─ assets/
│  │  ├─ coffee/
│  │  └─ shops/
│  ├─ components/
│  │  ├─ Layout.astro
│  │  ├─ Header.astro
│  │  ├─ Footer.astro
│  │  ├─ CoffeeCard.astro
│  │  └─ ShopCard.astro
│  ├─ content/
│  │  └─ coffee-log/
│  ├─ pages/
│  │  ├─ index.astro
│  │  └─ coffee/
│  │     ├─ index.astro
│  │     └─ [slug].astro
│  ├─ styles/
│  │  └─ global.css
│  └─ content.config.ts
├─ public/
├─ astro.config.mjs
├─ package.json
└─ README.md
```

## Content Schema Draft

```ts
const coffeeLog = defineCollection({
  loader: glob({ base: "./src/content/coffee-log", pattern: "**/*.{md,mdx}" }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    place: z.string().optional(),
    brew_method: z.string().optional(),
    roaster: z.string().optional(),
    tags: z.array(z.string()).default([]),
    recommended: z.boolean().default(false),
    draft: z.boolean().default(false),
  }),
});
```

## Image Policy

MVPでは外部画像ストレージを入れない。

- 少数の写真は `src/assets/coffee/` または `public/` に置く。
- スマホ写真をそのまま大量投入しない。
- 最初は画像なしでもページ完成を優先する。
- 画像が増えたら圧縮スクリプト、Cloudinary、Cloudflare R2などを検討する。

## Deferred Features

| Feature | Defer Reason |
| --- | --- |
| Headless CMS | PCでMDX更新できるため初期不要 |
| DB | Coffee LogはContent Collectionsで十分 |
| 店舗マップ | Favorite Shopsの内容が溜まってからでよい |
| 検索 | 記事数が少ない初期は不要 |
| RSS | EssayやLogが増えてからでよい |
| 認証 | 公開記事だけのMVPには不要 |
| Next.js | 診断、管理画面、API、DB連携が必要になってから検討 |
