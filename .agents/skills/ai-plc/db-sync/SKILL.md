# AI-PLC DB Sync

AI-PLC DBをローカルの正本として扱い、`projects` / `tasks` テーブルを Notion と双方向同期する。

既定配置:
- Claude Code install: `.claude/db/ai_plc.db`
- Cursor install: `.cursor/db/ai_plc.db`（導入している場合）
- Codex install: `.agents/db/ai_plc.db`（導入している場合）

## When to Use

- 「DBを同期して」「NotionのDBをPullして」→ pull
- 「タスクをNotionに反映して」「Push」→ push
- 「DB同期状態を確認して」「syncステータス」→ status
- 「DB同期」→ sync (双方向)
- プロジェクトやタスクをローカルで追加・更新した後にNotionへ反映したいとき
- Notion側の最新データをローカルに取り込みたいとき

## Commands

```bash
python3 .claude/db/sync.py pull              # Notion → ローカル（Claude Code例）
python3 .claude/db/sync.py push              # ローカル → Notion（Claude Code例）
python3 .claude/db/sync.py sync              # 双方向 (pull → push)
python3 .claude/db/sync.py status            # 差分プレビュー
python3 .claude/db/sync.py pull --dry-run    # dry-run (変更なし)
python3 .claude/db/sync.py push --dry-run    # dry-run (変更なし)
```

## Prerequisites

- `NOTION_API_TOKEN` 環境変数が設定済みであること
- 利用環境のAI-PLC DBが存在すること（Claude Code例: なければ `python3 .claude/db/init_db.py --import` で作成）

## Sync Logic

- **Pull**: Notion 側を query → `notion_last_edited` で差分検出 → AI-PLC DBを更新
- **Push**: `updated_at > last_sync_at` の行を検出 → Notion API で PATCH/POST
- **Conflict**: Pull時にローカルも変更されている行は CONFLICT としてスキップ（安全側）

## Data Model

| テーブル | ローカルDB | 同期先Notion DB | 用途 |
| --- | --- | --- | --- |
| projects | AI-PLC DB | AI-PLC Projects (`8f5680ac-...`) | プロジェクト管理 |
| tasks | AI-PLC DB | AI-PLC Tasks (`a4df4cf0-...`) | タスク管理 |

## Typical Workflow

1. `status` で差分を確認
2. `pull` でNotion側の最新を取得
3. ローカルで `plc_query.py` を使って編集
4. `push` でNotionに反映

## Related Files

- `db/ai_plc.db` — SQLite DB本体
- `db/init_db.py` — スキーマ作成 + マイグレーション
- `db/plc_query.py` — ローカルクエリヘルパー
- `db/sync.py` — 同期エンジン
- `db/README.md` — ドキュメント
