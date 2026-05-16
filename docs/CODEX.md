# Codex appでAI-PLCを使う

AI-PLCは、既存のClaude Code / Cursor向け配布に加えて、Codex app向けにもインストールできます。Codexでも中核の4ステージパイプラインは同じです。

`Collection -> Inception -> Construction -> Operation`

## インストール

```bash
git clone https://github.com/YOUR_USER/ai-plc.git
cd ai-plc
./install-codex.sh --target /path/to/your/project
```

変更内容だけ確認したい場合:

```bash
./install-codex.sh --dry-run --target /path/to/your/project
```

通常はCodex設定のexampleだけを配置します。`.codex/config.toml` が存在しない場合に作成したいときだけ、`--install-config` を指定してください。

```bash
./install-codex.sh --target /path/to/your/project --install-config
```

既存の `.codex/config.toml` は上書きしません。

## 配置されるもの

| Path | 役割 |
|------|------|
| `.agents/skills/ai-plc/` | Codexが参照するAI-PLC skill package |
| `AGENTS.md` | Codex用の短い運用ガイド。AI-PLC Codex markerでマージ |
| `.codex/config.ai-plc.example.toml` | 推奨Codex設定のexample |
| `.ai-plc-version` | インストール済みAI-PLCバージョン |

## 推奨Codex設定

AI-PLCでは、gpt-5.5 highを推奨設定として扱います。

```toml
model = "gpt-5.5"
model_reasoning_effort = "high"
approval_policy = "on-request"
sandbox_mode = "workspace-write"
web_search = "cached"
model_verbosity = "medium"
```

必要に応じて `.codex/config.ai-plc.example.toml` を確認し、自分のCodex設定へ反映してください。

## 基本フロー

最初はCollectionから始めます。

```text
$ai-plc-collection
Goal: ...
```

以後は順に進めます。

```text
$ai-plc-inception
$ai-plc-construction
$ai-plc-operation
```

主要成果物は `intent.yaml`, `context.yaml`, `backlog.yaml`, `Context/`, `Agents/`, `Documents/` です。複数ステップの作業では、ad-hoc実装よりもAI-PLC skill flowを優先します。

## Claude Code / Cursorとの違い

Claude Code installは `.claude/` にskillsや支援ファイルを配置します。Cursor installは `.cursor/` にskillsとrulesを配置します。Codex installは `.agents/skills/ai-plc/` にskillsを配置し、root `AGENTS.md` に短いCodex用セクションを追加し、`.codex/` に設定exampleを配置します。

パイプライン概念と `intent.yaml` / `context.yaml` / `backlog.yaml` / `Agents/` の命名は、3ターゲットで共通です。
