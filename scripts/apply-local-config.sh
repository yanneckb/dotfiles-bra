#!/usr/bin/env bash
# Sync ~/.gitconfig.local from ~/dotfiles/local.zsh
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
LOCAL_ZSH="$DOTFILES/local.zsh"
GITCONFIG_LOCAL="$HOME/.gitconfig.local"

if [[ ! -f "$LOCAL_ZSH" ]]; then
  echo "No local.zsh found — nothing to apply."
  exit 0
fi

zsh -c "
  source '$LOCAL_ZSH'

  if [[ -z \"\$LOCAL_GIT_NAME\" || -z \"\$LOCAL_GIT_EMAIL\" ]]; then
    echo 'LOCAL_GIT_NAME and LOCAL_GIT_EMAIL must be set in local.zsh' >&2
    exit 1
  fi

  cat > '$GITCONFIG_LOCAL' <<EOF
[user]
	name = \$LOCAL_GIT_NAME
	email = \$LOCAL_GIT_EMAIL

[core]
	excludesfile = ~/.gitignore_global
	excludefile = ~/.gitignore_global

[commit]
	template = ~/.stCommitMsg
EOF
"

echo "Updated $GITCONFIG_LOCAL"
