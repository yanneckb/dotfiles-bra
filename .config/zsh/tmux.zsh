########################
### Zsh Tmux Config ###
########################

# --- Aliases ---
alias t="tmux"
alias ta="tmux attach -t"
alias tls="tmux ls"
alias tn="tmux new -s"
alias tks="tmux kill-session -t"
alias tksa="tmux kill-session -a"
alias tkss="tmux kill-session -s"
alias tkssa="tmux kill-session -sa"
alias tksss="tmux kill-session -ss"
alias tksssa="tmux kill-session -ssa"
alias tlast="tmux attach-session -t $(tmux ls | awk -F: 'NR==1{print $1}')"

# --- Functions ---
### Start or attach to session
tm() {
  local session="$1"
  if [ -z "$session" ]; then
    echo "Usage: tm <session-name>"
    return 1
  fi

  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach -t "$session"
  else
    tmux new -s "$session"
  fi
}

### Start session in current directory with folder name
tmcd() {
  local session_name=$(basename "$PWD")
  tmux new-session -s "$session_name" -c "$PWD"
}

### Kill all tmux sessions (danger!)
tkillall() {
  for s in $(tmux ls 2>/dev/null | cut -d: -f1); do
    tmux kill-session -t "$s"
  done
}