#!/usr/bin/env bash
set -euo pipefail

# AI-PLC Installer for Codex app
# Installs AI-PLC pipeline skills, AGENTS.md guidance, and Codex config examples.
# Usage: ./install-codex.sh [--dry-run] [--target /path/to/project] [--install-config]

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VERSION="$(cat "$SCRIPT_DIR/.ai-plc-version" 2>/dev/null || echo "unknown")"
DRY_RUN=false
TARGET_DIR=""
INSTALL_CONFIG=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --dry-run) DRY_RUN=true; shift ;;
        --target) TARGET_DIR="$2"; shift 2 ;;
        --install-config) INSTALL_CONFIG=true; shift ;;
        -h|--help)
            echo "AI-PLC Installer for Codex app v${VERSION}"
            echo ""
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --dry-run          Show what would be done without making changes"
            echo "  --target PATH      Install to specified project directory"
            echo "  --install-config   Also create .codex/config.toml if missing"
            echo "  -h, --help         Show this help message"
            exit 0
            ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

if [[ -z "$TARGET_DIR" ]]; then
    TARGET_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
fi

BACKUP_SUFFIX=".bak.$(date +%Y%m%d)"

info()  { echo "  ✅ $1"; }
warn()  { echo "  ⚠️  $1"; }
skip()  { echo "  ⏭️  $1 (already exists, skipping)"; }
dry()   { echo "  🔍 [dry-run] $1"; }

safe_copy() {
    local src="$1" dst="$2"
    if [[ "$DRY_RUN" == true ]]; then
        dry "copy $src → $dst"
        return
    fi
    if [[ -f "$dst" ]]; then
        cp "$dst" "${dst}${BACKUP_SUFFIX}"
        warn "Backed up existing: ${dst}${BACKUP_SUFFIX}"
    fi
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    info "Created: $dst"
}

safe_copy_dir() {
    local src="$1" dst="$2"
    if [[ "$DRY_RUN" == true ]]; then
        dry "copy directory $src → $dst"
        return
    fi
    mkdir -p "$dst"
    cp -r "$src"/* "$dst"/ 2>/dev/null || true
    info "Installed directory: $dst"
}

safe_copy_if_missing() {
    local src="$1" dst="$2"
    if [[ -f "$dst" ]]; then
        skip "$dst"
        return
    fi
    if [[ "$DRY_RUN" == true ]]; then
        dry "copy $src → $dst (new)"
        return
    fi
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    info "Created: $dst"
}

merge_with_markers() {
    local template="$1" target="$2"
    local marker_start="<!-- AI-PLC CODEX START -->"
    local marker_end="<!-- AI-PLC CODEX END -->"

    if [[ "$DRY_RUN" == true ]]; then
        if [[ -f "$target" ]]; then
            dry "merge AI-PLC Codex section into existing $target"
        else
            dry "create $target from template"
        fi
        return
    fi

    if [[ ! -f "$target" ]]; then
        cp "$template" "$target"
        info "Created: $target"
        return
    fi

    cp "$target" "${target}${BACKUP_SUFFIX}"

    if grep -q "$marker_start" "$target" 2>/dev/null; then
        local tmp
        tmp="$(mktemp)"
        awk -v start="$marker_start" -v end="$marker_end" -v tpl="$template" '
            BEGIN { skip=0 }
            $0 ~ start { skip=1; while((getline line < tpl) > 0) print line; next }
            $0 ~ end { skip=0; next }
            skip==0 { print }
        ' "$target" > "$tmp"
        mv "$tmp" "$target"
        info "Updated AI-PLC Codex section in: $target"
    else
        echo "" >> "$target"
        cat "$template" >> "$target"
        info "Appended AI-PLC Codex section to: $target"
    fi
}

echo ""
echo "🚀 AI-PLC Installer for Codex app v${VERSION}"
echo "   Target: $TARGET_DIR"
if [[ "$DRY_RUN" == true ]]; then
    echo "   Mode: DRY RUN (no changes will be made)"
fi
echo ""

echo "📦 Step 1/5: Installing skills..."
safe_copy_dir "$SCRIPT_DIR/core/skills/ai-plc" "$TARGET_DIR/.agents/skills/ai-plc"
info "Skills installed: .agents/skills/ai-plc/"

echo ""
echo "📝 Step 2/5: Merging AGENTS.md..."
merge_with_markers "$SCRIPT_DIR/codex/AGENTS.md.template" "$TARGET_DIR/AGENTS.md"

echo ""
echo "🔧 Step 3/5: Installing Codex config example..."
safe_copy "$SCRIPT_DIR/codex/config.toml.template" "$TARGET_DIR/.codex/config.ai-plc.example.toml"
if [[ "$INSTALL_CONFIG" == true ]]; then
    safe_copy_if_missing "$SCRIPT_DIR/codex/config.toml.template" "$TARGET_DIR/.codex/config.toml"
else
    info "Skipped .codex/config.toml (use --install-config to create if missing)"
fi

echo ""
echo "📌 Step 4/5: Version marker..."
if [[ "$DRY_RUN" != true ]]; then
    cp "$SCRIPT_DIR/.ai-plc-version" "$TARGET_DIR/.ai-plc-version"
fi
info "Version: $VERSION"

echo ""
echo "✅ Step 5/5: Safety note..."
info ".codex/config.toml is never overwritten"

echo ""
echo "✨ AI-PLC for Codex app installed successfully!"
echo "   Version: $VERSION"
echo ""
echo "Next steps:"
echo "  1. Review AGENTS.md AI-PLC Codex section"
echo "  2. Review .codex/config.ai-plc.example.toml"
echo "  3. Use: \$ai-plc-collection"
echo ""
