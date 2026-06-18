# AGT_T005_content_collection

## Goal

Coffee LogをMDX + Astro Content Collectionsで管理できるようにし、サンプル記事を表示可能なデータとして用意する。

## Input

- `backlog.yaml` の `T005`
- T002完了後のAstroプロジェクト
- `Context/03_technical_stack_official_context.md`
- `Context/04_product_scope_content_model.md`

## Output

- `src/content.config.ts`
- `src/content/coffee-log/*.mdx`
- draft除外方針
- `Documents/T005_content_collection.md`

## Execution Flow

1. Autonomous: AstroのContent Collections構成を確認する。
2. Autonomous: `coffee-log` schemaを定義する。
3. Autonomous: MDX integrationが未導入なら追加する。
4. Autonomous: サンプルMDX記事を1から3件作成する。
5. Autonomous: `recommended` と `draft` の扱いを決める。
6. Verification: L1でschemaとfrontmatter、L2でT006/T007から利用可能か確認する。

## Guardrails

- 初期schemaを複雑にしすぎない。
- 実在店舗や個人情報を仮データに入れない。
- `draft: true` は公開一覧に出さない前提を維持する。

## Agent Instructions

後続ページ実装が簡単になるよう、frontmatterは最小だが型安全にする。MDX本文は短くてよい。
