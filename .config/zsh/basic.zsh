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

if command -v lsd >/dev/null; then
  alias ls='lsd'
  alias la='lsd -la'
elif command -v eza >/dev/null; then
  alias ls='eza --icons'
  alias la='eza -la --icons'
fi

alias chdsk='df -k .'

# --- Functions ---
cl() {
  command clear
  command -v fastfetch >/dev/null && fastfetch
}

proj() {
  local repo_root="${PROJ_DIR:-$HOME/repositories}"
  local target

  if [[ -n "$1" ]]; then
    if [[ -d "$repo_root/$1" ]]; then
      cd "$repo_root/$1"
      return 0
    fi

    if command -v zoxide >/dev/null; then
      target=$(zoxide query --list 2>/dev/null | rg -i "$1" | head -1)
      if [[ -n "$target" && -d "$target" ]]; then
        cd "$target"
        return 0
      fi
    fi

    echo "Project not found: $1"
    return 1
  fi

  if command -v fzf >/dev/null && [[ -d "$repo_root" ]]; then
    target=$(command find "$repo_root" -mindepth 1 -maxdepth 1 -type d 2>/dev/null \
      | fzf --prompt='Project> ' --height=40% --reverse)
    [[ -n "$target" ]] && cd "$target" && return 0
  fi

  echo "Usage: proj <name>  (or proj without args + fzf)"
  return 1
}
