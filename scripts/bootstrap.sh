#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
BREWFILE="$DOTFILES/Brewfile"

echo "╔══════════════════════════════════════╗"
echo "║   Dotfiles Bootstrap                 ║"
echo "╚══════════════════════════════════════╝"
echo ""

# --- Homebrew ---
if ! command -v brew >/dev/null; then
  echo "ERROR: Homebrew not found. Install from https://brew.sh"
  exit 1
fi

echo "==> [1/6] Checking Homebrew packages..."
if brew bundle check --file="$BREWFILE" >/dev/null 2>&1; then
  echo "    All Brewfile dependencies satisfied."
else
  echo "    Installing missing packages..."
  brew bundle install --file="$BREWFILE"
fi

# --- Git identity ---
echo "==> [2/6] Git config..."
if [[ ! -f "$HOME/.gitconfig.local" ]]; then
  if [[ -f "$DOTFILES/.gitconfig.local.example" ]]; then
    cp "$DOTFILES/.gitconfig.local.example" "$HOME/.gitconfig.local"
    echo "    Created ~/.gitconfig.local — edit name/email!"
  fi
else
  echo "    ~/.gitconfig.local exists."
fi

# --- Stow ---
echo "==> [3/6] Stowing dotfiles..."
cd "$DOTFILES"

if [[ -d "$HOME/.config/nvim" && ! -L "$HOME/.config/nvim/init.lua" ]] 2>/dev/null; then
  echo "    WARNING: existing ~/.config/nvim (not stowed)."
  echo "    Backup: mv ~/.config/nvim ~/.config/nvim.bak"
  echo "    Or adopt: stow --adopt .config && stow -R ."
fi

stow -R .

# --- mise ---
echo "==> [4/6] mise runtime manager..."
if command -v mise >/dev/null; then
  mise trust "$DOTFILES/.config/mise/config.toml" 2>/dev/null || true
  mise install 2>/dev/null || true
  echo "    mise ready."
else
  echo "    mise not found — skipped."
fi

# --- atuin ---
echo "==> [5/6] atuin history..."
if command -v atuin >/dev/null; then
  if atuin status 2>/dev/null | rg -q "Logged in"; then
    atuin import auto 2>/dev/null || true
    atuin sync 2>/dev/null || true
    echo "    atuin synced."
  else
    echo "    Run once: atuin register"
    echo "    Then:     atuin import auto"
  fi
else
  echo "    atuin not found — skipped."
fi

# --- Shell ---
echo "==> [6/6] Shell setup..."
if [[ "$(basename "$SHELL")" != "zsh" ]]; then
  echo "    Consider: chsh -s $(which zsh)"
fi

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   Done!                              ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. source ~/.zshrc"
echo "  2. atuin register          (if not done)"
echo "  3. Edit ~/.gitconfig.local (name/email)"
echo "  4. nvim                    (LazyVim first launch)"
echo ""
echo "Verify: brew bundle check --file=$BREWFILE"
