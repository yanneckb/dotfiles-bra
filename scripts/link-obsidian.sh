#!/usr/bin/env bash
# Symlink dotfiles docs + README into Obsidian vault.
# Source of truth stays in ~/dotfiles (edit in Obsidian or repo — same files).
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
LOCAL_ZSH="$DOTFILES/local.zsh"

if [[ -f "$LOCAL_ZSH" ]]; then
  # shellcheck source=/dev/null
  source "$LOCAL_ZSH"
fi

VAULT="${OBSIDIAN_VAULT:-}"
LINK_DIR="${OBSIDIAN_LINK_DIR:-$VAULT/Dotfile System}"
DOCS_LINK="$LINK_DIR/Dotfiles"
DOCS_TARGET="$DOTFILES/.docs"
README_LINK="$LINK_DIR/README.md"
README_TARGET="$DOTFILES/README.md"

if [[ -z "$VAULT" ]]; then
  echo "ERROR: OBSIDIAN_VAULT not set."
  echo "Copy local.zsh.example to local.zsh and set OBSIDIAN_VAULT."
  exit 1
fi

if [[ ! -d "$VAULT" ]]; then
  echo "ERROR: Vault not found: $VAULT"
  exit 1
fi

if [[ ! -d "$DOCS_TARGET" ]]; then
  echo "ERROR: $DOCS_TARGET not found"
  exit 1
fi

if [[ ! -f "$README_TARGET" ]]; then
  echo "ERROR: $README_TARGET not found"
  exit 1
fi

mkdir -p "$LINK_DIR"

link_path() {
  local link="$1"
  local target="$2"

  if [[ -L "$link" ]]; then
    rm "$link"
  elif [[ -d "$link" ]]; then
    if [[ -n "$(ls -A "$link" 2>/dev/null)" ]]; then
      echo "ERROR: $link exists and is not empty. Move files first."
      exit 1
    fi
    rmdir "$link"
  elif [[ -e "$link" ]]; then
    echo "ERROR: $link exists and is not a symlink"
    exit 1
  fi

  ln -s "$target" "$link"
  echo "Linked: $link -> $target"
}

link_path "$DOCS_LINK" "$DOCS_TARGET"
link_path "$README_LINK" "$README_TARGET"

echo ""
echo "Obsidian: $LINK_DIR"
echo "  README.md  — project overview"
echo "  Dotfiles/  — detailed docs (.docs)"
