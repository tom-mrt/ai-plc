# AI-PLC DB Sync

AI-PLC DBをローカルの正本として扱い、`projects` / `tasks` テーブルと
`intent.yaml` / `backlog.yaml` / `context.yaml` の差分を確認・同期するための補助スキル。

既定配置:
- Claude Code install: `.claude/db/ai_plc.db`
- Cursor install: `.cursor/db/ai_plc.db`（導入している場合）
- Codex install: `.agents/db/ai_plc.db`（導入している場合）

## When to Use

- 「AI-PLC DBを同期して」「ローカルDBを更新して」→ sync
- 「YAMLとの差分を確認して」「syncステータス」→ status
- 「外部連携向けに差分を確認して」→ status / dry-run
- プロジェクトやタスクをローカルファイルで追加・更新した後にSQLiteへ反映したいとき
- 外部DB・Issue tracker・Webhookなどへ渡す前に、ローカル正本との差分を確認したいとき

## Commands

利用環境に `db/sync.py` がある場合のみ実行する。未導入の環境では、手動で
`intent.yaml` / `backlog.yaml` / `context.yaml` とAI-PLC SQLite DBの差分を確認する。

```bash
python3 .claude/db/sync.py pull              # ローカルファイル → SQLite（Claude Code例）
python3 .claude/db/sync.py push              # SQLite → ローカルファイル（Claude Code例）
python3 .claude/db/sync.py sync              # 双方向差分確認と反映
python3 .claude/db/sync.py status            # 差分プレビュー
python3 .claude/db/sync.py pull --dry-run    # dry-run (変更なし)
python3 .claude/db/sync.py push --dry-run    # dry-run (変更なし)
```

## Prerequisites

- 利用環境のAI-PLC DBが存在すること
- `intent.yaml` / `backlog.yaml` / `context.yaml` がローカル正本として読めること
- 外部連携を行う場合は、各連携先の adapter / CLI / MCP が別途利用可能であること

## Sync Logic

- **Pull**: ローカルYAML/Markdownの正本を読み、SQLiteの `projects` / `tasks` を更新
- **Push**: SQLite側の差分をローカルYAML/Markdownに反映
- **Status**: 反映前に差分を表示し、意図しない上書きを防ぐ
- **Conflict**: 同一項目が双方で変更されている場合は CONFLICT としてスキップし、手動判断を求める

## External Integrations

外部連携は `intent.yaml` の `sync_targets` に宣言された場合だけ扱う。未実装の連携先を
実装済みとして扱わず、status / dry-run で差分を確認してから、利用可能な adapter がある
連携先だけに push する。

例:

```yaml
sync_targets:
  - type: github_issues
    target: "owner/repo"
    sync_direction: push
  - type: linear
    target: "TEAM"
    sync_direction: push
  - type: external_db
    target: "local-or-remote-db-alias"
    sync_direction: push
  - type: custom_webhook
    target: "webhook-alias"
    sync_direction: push
```

## Data Model

| テーブル | ローカルDB | 用途 |
| --- | --- | --- |
| projects | AI-PLC SQLite DB | プロジェクト管理 |
| tasks | AI-PLC SQLite DB | タスク管理 |

## Typical Workflow

1. `status` でローカルファイルとSQLiteの差分を確認
2. 必要に応じて `pull --dry-run` または `push --dry-run` を実行
3. 差分が妥当なら `sync` を実行
4. 外部連携が必要な場合は、利用可能な adapter を確認してから個別に push

## Related Files

- `db/ai_plc.db` — SQLite DB本体
- `db/init_db.py` — スキーマ作成 + マイグレーション
- `db/plc_query.py` — ローカルクエリヘルパー
- `db/sync.py` — 同期エンジン（導入環境のみ）
- `db/README.md` — ドキュメント
