# AGT_T003_tailwind_daisyui_setup

## Goal

AstroプロジェクトにTailwind CSS v4とdaisyUIを導入し、最小UIクラスが画面に反映される状態にする。

## Input

- `backlog.yaml` の `T003`
- T002で作成したAstroプロジェクト
- `Context/03_technical_stack_official_context.md`

## Output

- 更新済み `astro.config.mjs`
- Tailwind/daisyUIを読み込むCSSファイル
- daisyUIクラス反映確認
- `Documents/T003_tailwind_daisyui_setup.md`

## Execution Flow

1. Autonomous: 既存のAstro設定とCSS構成を確認する。
2. Autonomous: 公式手順に沿って `tailwindcss`, `@tailwindcss/vite`, `daisyui` を追加する。
3. Autonomous: `astro.config.mjs` にTailwind Vite pluginを設定する。
4. Autonomous: CSSに `@import "tailwindcss";` と `@plugin "daisyui";` を追加する。
5. Autonomous: 最小の `btn` / `card` / `badge` 表示で反映を確認する。
6. Verification: L1で設定ファイル、L2でT004以降の共通UI基盤として使えるか確認する。

## Guardrails

- Tailwind v3系の `tailwind.config.*` 前提を混ぜない。
- UIはdaisyUIの基本部品に絞り、テーマ過多にしない。
- 導入時の依存関係変更を記録する。

## Agent Instructions

導入後は必ずローカル表示で視覚確認する。ビルドエラーが出る場合は、設定を追加する前の状態と差分を確認して原因を分ける。
