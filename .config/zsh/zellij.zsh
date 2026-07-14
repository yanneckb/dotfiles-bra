##########################
### Zellij ###
##########################

alias zja='zellij attach'
alias zjl='zellij list-sessions'
alias zjk='zellij kill-session'
alias zjka='zellij kill-all-sessions'

zj() {
  local session="$1"

  if [[ -z "$session" ]]; then
    zellij
    return $?
  fi

  if zellij list-sessions 2>/dev/null | rg -q "^${session}\b"; then
    zellij attach "$session"
  else
    zellij --session "$session"
  fi
}

zjcd() {
  local session_name
  session_name="$(basename "$PWD")"
  zellij --session "$session_name" --cwd "$PWD"
}

zjkillall() {
  local session
  for session in $(zellij list-sessions 2>/dev/null | awk '{print $1}'); do
    zellij kill-session "$session"
  done
}
