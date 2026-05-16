#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "== bash syntax =="
bash -n "$REPO_ROOT/install.sh" \
    "$REPO_ROOT/install-cc.sh" \
    "$REPO_ROOT/install-cursor.sh" \
    "$REPO_ROOT/install-codex.sh" \
    "$REPO_ROOT/uninstall.sh"

TMP_ROOT="$(mktemp -d)"
cleanup() {
    rm -rf "$TMP_ROOT"
}
trap cleanup EXIT

TARGET="$TMP_ROOT/target"
mkdir -p "$TARGET"
git -C "$TARGET" init >/dev/null
printf 'user config\n' > "$TARGET/.codex-config-before"
mkdir -p "$TARGET/.codex"
printf 'custom = true\n' > "$TARGET/.codex/config.toml"

echo "== install codex =="
bash "$REPO_ROOT/install-codex.sh" --target "$TARGET"

required_paths=(
    "AGENTS.md"
    ".agents/skills/ai-plc/01-collection/SKILL.md"
    ".agents/skills/ai-plc/02-inception/SKILL.md"
    ".agents/skills/ai-plc/03-construction/SKILL.md"
    ".agents/skills/ai-plc/04-operation/SKILL.md"
    ".codex/config.ai-plc.example.toml"
    ".ai-plc-version"
)

for path in "${required_paths[@]}"; do
    if [[ ! -e "$TARGET/$path" ]]; then
        echo "missing: $path" >&2
        exit 1
    fi
done

for skill in \
    "$TARGET/.agents/skills/ai-plc/01-collection/SKILL.md" \
    "$TARGET/.agents/skills/ai-plc/02-inception/SKILL.md" \
    "$TARGET/.agents/skills/ai-plc/03-construction/SKILL.md" \
    "$TARGET/.agents/skills/ai-plc/04-operation/SKILL.md"; do
    grep -q '^name: ' "$skill"
    grep -q '^description: ' "$skill"
done

if ! grep -q '<!-- AI-PLC CODEX START -->' "$TARGET/AGENTS.md"; then
    echo "missing Codex marker in AGENTS.md" >&2
    exit 1
fi

echo "== uninstall =="
bash "$REPO_ROOT/uninstall.sh" --target "$TARGET"

if [[ -e "$TARGET/.agents/skills/ai-plc" ]]; then
    echo "Codex skills were not removed" >&2
    exit 1
fi

if grep -q '<!-- AI-PLC CODEX START -->' "$TARGET/AGENTS.md"; then
    echo "Codex marker section was not removed from AGENTS.md" >&2
    exit 1
fi

if [[ ! -f "$TARGET/.codex/config.toml" ]]; then
    echo ".codex/config.toml was removed" >&2
    exit 1
fi

if ! grep -q 'custom = true' "$TARGET/.codex/config.toml"; then
    echo ".codex/config.toml was modified" >&2
    exit 1
fi

TARGET_WITH_CONFIG="$TMP_ROOT/target-with-config"
mkdir -p "$TARGET_WITH_CONFIG"
git -C "$TARGET_WITH_CONFIG" init >/dev/null

echo "== install codex with config =="
bash "$REPO_ROOT/install-codex.sh" --target "$TARGET_WITH_CONFIG" --install-config

if [[ ! -f "$TARGET_WITH_CONFIG/.codex/config.toml" ]]; then
    echo ".codex/config.toml was not created by --install-config" >&2
    exit 1
fi

if ! cmp -s "$REPO_ROOT/codex/config.toml.template" "$TARGET_WITH_CONFIG/.codex/config.toml"; then
    echo ".codex/config.toml does not match Codex template" >&2
    exit 1
fi

echo "Codex install validation passed."
