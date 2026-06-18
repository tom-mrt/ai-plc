# T001 開発環境と作業場所の確認

## 実行情報

- Scope ID: `L-0617`
- Task: `T001 開発環境と作業場所の確認`
- 実行日: 2026-06-17
- 実行場所: `/Users/tomoyamorita/Projects/ai-plc`

## 確認したコマンド

| コマンド | 結果 | 判定 |
| --- | --- | --- |
| `node -v` | `v22.22.2` | OK |
| `npm -v` | `10.9.7` | OK |
| `git --version` | `git version 2.50.1 (Apple Git-155)` | OK |
| `docker --version` | `Docker version 29.3.1, build c2be9cc` | OK |
| `docker compose version` | `Docker Compose version v5.1.1` | OK |
| `pwd` | `/Users/tomoyamorita/Projects/ai-plc` | OK |

## Git状態

`git status --short` では以下が未追跡として表示された。

```text
?? .DS_Store
?? .agents/
?? .codex/
?? AGENTS.md
?? Flow/
```

今回のT001ではGit操作、stage、commit、pushは実行していない。

## 作業場所の仮決定

現時点のCodex作業権限で安全に作れる場所として、次をT002の作成先候補にする。

```text
/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee
```

理由:

- 現在の書き込み可能rootが `/Users/tomoyamorita/Projects/ai-plc` のため、追加承認なしで作業できる。
- AI-PLCの管理成果物と実サイト本体を `workspaces/` で分けられる。
- 将来GitHubに切り出す場合も、`workspaces/meishi-coffee` を独立プロジェクトとして扱いやすい。

注意:

- 完全に独立したリポジトリとして `/Users/tomoyamorita/Projects/meishi-coffee` に作りたい場合は、T002開始前に作成先を変更する。
- この仮決定はT002開始前なら変更可能。

## プロジェクト名・repository名候補

| 項目 | 仮決定 |
| --- | --- |
| プロジェクト名 | `meishi-coffee` |
| ディレクトリ名 | `meishi-coffee` |
| GitHub repository名 | `meishi-coffee` |
| Cloudflare Pages想定サブドメイン | `meishi-coffee.pages.dev` |

## 外部操作ゲート

以下は本人の明示承認があるまで実行しない。

- GitHub repository作成
- `git push`
- Cloudflare Pages接続
- 外部公開
- Cloudflare Web Analytics導入
- 独自ドメイン取得
- DNS設定

## 次のタスクへの引き継ぎ

T002では、上記の仮作業場所にDocker前提でAstro最小プロジェクトを作成する。

Docker化の方針:

- ホストMacで `npm install` を直接実行しない。
- `npm create astro@latest` は `node:22-bookworm` コンテナ内で実行する。
- `node_modules` はDocker named volumeに置き、ホスト側に作らない。
- ソースコード、`package.json`、`compose.yaml` はホスト側に残す。

開始前に確認すべきこと:

1. 作成先を `/Users/tomoyamorita/Projects/ai-plc/workspaces/meishi-coffee` のままでよいか。
2. プロジェクト名を `meishi-coffee` のままでよいか。
3. Docker image `node:22-bookworm` のpullと、Docker volume作成を許容するか。

## 検証

- L1: Node.js / npm / Git / Docker / Docker Compose の確認結果、作業場所候補、外部操作ゲートが記録されている。
- L2: T002の前提であるAstroプロジェクト作成先、プロジェクト名、Docker実行方針が仮決定されている。
