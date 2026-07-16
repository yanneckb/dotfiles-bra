#######################
### Basic Functions ###
#######################

typeset -g PROJ_DIR="${PROJ_DIR:-$HOME/repositories}"
typeset -g -A REPO_MAP=()

local _local_zsh="${DOTFILES:-$HOME/dotfiles}/local.zsh"
[[ -f "$_local_zsh" ]] && source "$_local_zsh"
unset _local_zsh

cl() {
  command clear
  command -v fastfetch >/dev/null && fastfetch
}

proj() {
  local target

  if [[ -n "$1" ]]; then
    if [[ -d "$PROJ_DIR/$1" ]]; then
      cd "$PROJ_DIR/$1"
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

  if command -v fzf >/dev/null && [[ -d "$PROJ_DIR" ]]; then
    target=$(command find "$PROJ_DIR" -mindepth 1 -maxdepth 1 -type d 2>/dev/null \
      | fzf --prompt='Project> ' --height=40% --reverse)
    [[ -n "$target" ]] && cd "$target" && return 0
  fi

  echo "Usage: proj <name>  (or proj without args + fzf)"
  return 1
}

rep() {
  if (( ${#REPO_MAP} == 0 )); then
    echo "No projects configured. Copy local.zsh.example to local.zsh"
    return 1
  fi

  if [[ -z "$1" ]]; then
    echo "Usage: rep <project>"
    echo "Available projects:"
    for key in ${(ko)REPO_MAP}; do
      echo "  $key -> ${REPO_MAP[$key]}"
    done
    return 1
  fi

  local target="${REPO_MAP[$1]}"

  if [[ -z "$target" ]]; then
    echo "Unknown project: $1"
    return 1
  fi

  cd "$PROJ_DIR/$target" || return 1
}
