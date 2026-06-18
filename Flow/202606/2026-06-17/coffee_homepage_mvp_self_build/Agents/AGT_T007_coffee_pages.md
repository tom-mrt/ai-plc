# AGT_T007_coffee_pages

## Goal

Coffee Log一覧ページと詳細ページを実装し、MDX記事をサイト上で読める状態にする。

## Input

- `backlog.yaml` の `T007`
- T004のLayout/Header/Footer
- T005のCoffee Log collection
- `Context/04_product_scope_content_model.md`

## Output

- `src/pages/coffee/index.astro`
- `src/pages/coffee/[slug].astro`
- 記事カードまたは一覧コンポーネント
- `Documents/T007_coffee_pages.md`

## Execution Flow

1. Autonomous: Coffee Log collectionから公開記事を取得する。
2. Autonomous: `/coffee/` で日付順一覧を表示する。
3. Autonomous: `/coffee/[slug]/` でMDX本文を表示する。
4. Autonomous: タグ、日付、戻る導線を整える。
5. Autonomous: `draft: true` の記事を一覧と静的パスから除外する。
6. Verification: L1で一覧・詳細、L2でトップページからの遷移と戻り導線を確認する。

## Guardrails

- 記事数が少ない前提で空状態も崩れないようにする。
- slug生成とdraft除外で公開事故を起こさない。
- ルーティングを過度に抽象化しない。

## Agent Instructions

Astro Content Collectionsの標準APIを優先する。大量の記事や検索はMVP外として実装しない。
