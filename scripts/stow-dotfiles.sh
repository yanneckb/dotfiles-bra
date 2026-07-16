#!/usr/bin/env bash
# Stow dotfiles with ignores from .stow-local-ignore (GNU Stow has no built-in ignore file).
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
IGNORE_FILE="$DOTFILES/.stow-local-ignore"

cd "$DOTFILES"

stow_args=()
if [[ -f "$IGNORE_FILE" ]]; then
  while IFS= read -r pattern || [[ -n "$pattern" ]]; do
    [[ "$pattern" =~ ^[[:space:]]*# ]] && continue
    pattern="${pattern// /}"
    [[ -z "$pattern" ]] && continue
    stow_args+=(--ignore="$pattern")
  done < "$IGNORE_FILE"
fi

if (($# == 0)); then
  set -- -R .
fi

stow "${stow_args[@]}" "$@"
