# AGT_T004_layout_navigation

## Goal

全ページ共通のLayout、Header、Footerを作り、トップとCoffee Logへ迷わず移動できる骨格を作る。

## Input

- `backlog.yaml` の `T004`
- T003完了後のAstroプロジェクト
- `Context/04_product_scope_content_model.md`

## Output

- `src/components/Layout.astro`
- `src/components/Header.astro`
- `src/components/Footer.astro`
- トップページへの適用
- `Documents/T004_layout_navigation.md`

## Execution Flow

1. Autonomous: 現在の `src/` 構成を確認する。
2. Autonomous: Layout/Header/Footerの責務を分ける。
3. Autonomous: トップとCoffee Logだけを持つ最小ナビを実装する。
4. Autonomous: daisyUIの `navbar` / `footer` を必要最小限で使う。
5. Mob Checkpoint: ナビ文言とサイト名の仮置きを確認する。
6. Verification: L1で各コンポーネント、L2でページ全体の導線とレスポンシブを確認する。

## Guardrails

- ランディングページ風の大きな説明ではなく、実サイトの骨格を先に作る。
- ナビ項目を増やしすぎない。
- 文字がボタンやナビからはみ出さないようにする。

## Agent Instructions

既存のAstro構造に合わせて小さく追加する。見た目よりも、後続T006/T007で再利用しやすい責務分離を優先する。
