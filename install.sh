#!/usr/bin/env bash
# Cairn manual installer.
# Symlinks each Cairn skill into the Claude Code and Codex skill directories.
# The recommended install path is `npx skills add <owner>/cairn`; use this only
# for manual/local installs. This script only creates symlinks — nothing else.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"

install_into() {
  local dest="$1"
  mkdir -p "$dest"
  for skill in "$SKILLS_SRC"/*/; do
    name="$(basename "$skill")"
    ln -sfn "$skill" "$dest/$name"
    echo "  linked $name"
  done
}

echo "Installing Cairn skills (symlinks)..."

echo "Claude Code  -> $HOME/.claude/skills"
install_into "$HOME/.claude/skills"

echo "Codex        -> $HOME/.agents/skills"
install_into "$HOME/.agents/skills"

echo
echo "Done. Restart your agent session to pick up the new skills."
echo "Then run 'cairn-onboard' inside a project to set up its docs."
