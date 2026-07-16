###################
### Basic Config ###
###################

# --- Modern CLI aliases ---
if command -v bat >/dev/null; then
  alias cat='bat --paging=never'
  alias less='bat'
fi

if command -v rg >/dev/null; then
  alias grep='rg'
fi

if command -v fd >/dev/null; then
  alias find='fd'
fi

# --- Navigation ---
alias ..='cd ..'
alias ...='cd ../..'
alias lg='lazygit'
alias c='clear'
alias gfl='git fetch --all && git pull'

if command -v lsd >/dev/null; then
  alias ls='lsd'
  alias la='lsd -la'
elif command -v eza >/dev/null; then
  alias ls='eza --icons'
  alias la='eza -la --icons'
fi

alias chdsk='df -k .'

source "${0:A:h}/functions/basics.zsh"
