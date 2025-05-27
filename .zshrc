#########################
### Zsh Configuration ###
#########################

### Set language to German
export LANG=de_DE.UTF-8

### source dotfiles
for file in ~/.config/zsh/*.zsh; do
  source $file
done

### zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Plugins via zinit
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Oh-My-Zsh style plugin replacements
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

### Load completions
autoload -U compinit && compinit
zinit cdreplay -q

### fastfetch
fastfetch

### Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

### History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

### Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -G $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -G $realpath'

### Theme via starship
eval "$(starship init zsh)"

### Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

### Puppeteer configuration (macOS)
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=$(which chromium)

### Git Auto Fetch (OMZ Plugin is replaced, manually added)
export GIT_AUTO_FETCH_INTERVAL=1200

### Node.js Version Management (nvm + avn)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

autoload -U add-zsh-hook

add-zsh-hook chpwd load-nvmrc
load-nvmrc

### Homebrew shellenv (macOS only)
eval "$(/opt/homebrew/bin/brew shellenv)"
