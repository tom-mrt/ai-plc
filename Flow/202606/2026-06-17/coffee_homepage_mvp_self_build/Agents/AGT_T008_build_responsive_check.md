# AGT_T008_build_responsive_check

## Goal

主要ページのレスポンシブ表示とビルドを検証し、公開前に最低限の品質を満たす状態にする。

## Input

- `backlog.yaml` の `T008`
- T006/T007完了後のAstroプロジェクト
- `Context/05_constraints_risks_sources.md`

## Output

- `npm run build` 結果
- スマホ幅・デスクトップ幅の確認結果
- 既知課題一覧
- `Documents/T008_build_responsive_check.md`

## Execution Flow

1. Autonomous: `npm run build` を実行し、結果を記録する。
2. Autonomous: dev serverを起動し、トップ、Coffee Log一覧、詳細を確認する。
3. Autonomous: スマホ幅とデスクトップ幅で文字はみ出し・重なり・導線を確認する。
4. Autonomous: エラーや表示崩れがあれば修正候補を整理する。
5. Mob Checkpoint: 公開前に許容する既知課題を確認する。
6. Verification: L1で各ページ、L2でMVP全体の公開準備状態を判定する。

## Guardrails

- ビルド失敗状態でT009へ進まない。
- スクリーンショットや検証結果を過剰に増やさず、必要な確認に絞る。
- 外部公開は実行しない。

## Agent Instructions

レビューAgentとして、修正そのものより検証と問題特定を優先する。ただし明らかな小修正はユーザー承認のうえで対応してよい。
