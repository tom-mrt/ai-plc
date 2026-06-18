# AGT_T001_environment_check

## Goal

開発環境と作業場所を確認し、Astro MVP作成を始められる状態にする。

## Input

- `intent.yaml`
- `context.yaml`
- `backlog.yaml` の `T001`
- `Context/02_beginner_learning_path.md`
- `Context/05_constraints_risks_sources.md`

## Output

- `Documents/T001_environment_check.md`
- Node.js / npm / Git の確認結果
- 作業ディレクトリ、プロジェクト名、repository名候補
- 外部操作の承認ゲート確認

## Execution Flow

1. Autonomous: `node -v`, `npm -v`, `git --version` の確認コマンドを提案または実行する。
2. Autonomous: 作成先ディレクトリ候補とプロジェクト名候補を整理する。
3. Mob Checkpoint: 作業場所とプロジェクト名をユーザーに確認する。
4. Autonomous: 確認結果を `Documents/T001_environment_check.md` に保存する。
5. Verification: L1で確認項目の欠落、L2で後続T002の前提と整合するか確認する。

## Guardrails

- GitHub repository作成、`git push`、Cloudflare接続は実行しない。
- ユーザーが自力で追えるよう、実行したコマンドと結果を残す。
- 環境不足があれば、インストール前に承認を取る。

## Agent Instructions

Stage 4でこのAgentを実行するときは、まず現環境を読み取り、足りないものを明確にする。セットアップ作業は最小限にし、後続タスクが安全に始められる状態を作る。
