# ZSH shell commands

## Aliases
- `alias ..='cd ..'`
- `alias ...='cd ../..'`
- `alias lg='lazygit'`
- `alias ls='lsd'`

## Keybindings (^ = ctrl)
- `bindkey -e`
- `bindkey '^p' history-search-backward`
- `bindkey '^n' history-search-forward`

## Commands

### zsh commands
```
^b  # move cursor left
^f  # move cursor right
^a  # move cursor to the beginning of the line
^e  # move cursor to the end of the line
^d  # delete character under the cursor
^u  # delete from cursor to the beginning of the line
^k  # delete from cursor to the end of the line
^w  # delete from cursor to the beginning of the word
^y  # paste from clipboard
^p  # paste from history
^n  # search history forward
^r  # search history backward
^h  # delete character before cursor
^t  # swap character before cursor and cursor
^j  # move cursor down
^k  # move cursor up
^l  # clear screen
^c  # clear screen
^x  # clear screen
^v  # toggle visual mode
```
### yazi cheat sheet
```
$ yazi
```

### tmux
```
$ tmux
$ tmux new -s name # create new session
$ tmux ls # list sessions
$ tmux attach -t name # attach to session
$ tmux kill-session -t name # kill session
$ tmux kill-server # kill server
$ tmux new-session -s name # create new session
$ tmux new-window -t name # create new window
$ tmux rename-window -t name # rename window
$ tmux list-windows -t name # list windows
$ tmux kill-window -t name # kill window
$ tmux select-window -t name # select window
$ tmux last-window -t name # last window
$ tmux last-pane -t name # last pane
$ tmux list-panes -t name # list panes
$ tmux kill-pane -t name # kill pane
$ tmux select-pane -t name # select pane
$ tmux send-keys -t name "command" Enter # send command to pane
$ tmux send-keys -t name "command" C-m # send command to pane and press enter
```

### neovim
```
$ nvim
```

### fzf
- fuzzy finder
  - `fzf`        # fuzzy finder
  - `fzf -d`     # fuzzy finder with preview
  - `fzf -m`     # fuzzy finder with multi-select
  - `fzf -m -d`  # fuzzy finder with multi-select and preview
  - `fzf -e`     # fuzzy finder with enter to accept
  - `fzf -e -d`  # fuzzy finder with enter to accept and preview

### lsd
- directory listing
  - `lsd`        # directory listing
  - `lsd -a`     # directory listing with hidden files
  - `lsd -l`     # directory listing with long format
  - `lsd -la`    # directory listing with long format and hidden files
  - `lsd -t`     # directory listing with tree format
  - `lsd -lt`    # directory listing with tree format and hidden files