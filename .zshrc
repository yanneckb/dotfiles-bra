#########################
### Zsh Configuration ###
#########################

### Homebrew shellenv (macOS only) → direkt am Anfang!
eval "$(/opt/homebrew/bin/brew shellenv)"

### Set language to German
export LANG=de_DE.UTF-8

### Deduplicate PATH entries automatically
typeset -U path

### source dotfiles
for file in ~/.config/zsh/*.zsh; do
  source $file
done

### zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Plugins via zinit (loaded async with turbo mode for faster startup)
zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid atload'!_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light Aloxaf/fzf-tab

zinit ice wait lucid
zinit light paulirish/git-open

zinit ice wait lucid
zinit light tj/git-extras

# Optional: reminds you about unused aliases
zinit ice wait lucid
zinit light MichaelAquilina/zsh-you-should-use

# Optional: better history substring search (works well with ^p/^n bindings below)
zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

# Oh-My-Zsh style plugin replacements
zinit ice wait lucid
zinit snippet OMZL::git.zsh

zinit ice wait lucid
zinit snippet OMZP::git

zinit ice wait lucid
zinit snippet OMZP::sudo

zinit ice wait lucid
zinit snippet OMZP::command-not-found

### Load completions (cached, only rebuilt once per day)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zinit cdreplay -q

### fastfetch (nur wenn installiert)
command -v fastfetch >/dev/null && fastfetch

### Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

### History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups \
       hist_save_no_dups hist_ignore_dups hist_find_no_dups

### Quality of life options
setopt auto_cd            # type "projectdir" instead of "cd projectdir"
setopt extended_glob       # more powerful globbing patterns
setopt no_case_glob        # case-insensitive globbing

### Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -G $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -G $realpath'

### Theme via starship
eval "$(starship init zsh)"

### Shell integrations (nur wenn installiert)
command -v fzf >/dev/null && eval "$(fzf --zsh)"
command -v zoxide >/dev/null && eval "$(zoxide init --cmd cd zsh)"
command -v eza >/dev/null && alias ls="eza --icons"

### Puppeteer configuration (macOS, only if chromium is installed)
if command -v chromium >/dev/null; then
  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
  export PUPPETEER_EXECUTABLE_PATH=$(command -v chromium)
fi

### Git Auto Fetch
export GIT_AUTO_FETCH_INTERVAL=1200

### Node.js Version Management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"
autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc
load-nvmrc
