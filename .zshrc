#########################
### Zsh Configuration ###
#########################

### Homebrew shellenv (macOS only)
eval "$(/opt/homebrew/bin/brew shellenv)"

### Set language to German
export LANG=de_DE.UTF-8

### Deduplicate PATH entries automatically
typeset -U path

### source dotfiles (alphabetical: basic, ddev, gitlab, shopware, zellij)
for file in ~/.config/zsh/*.zsh(N); do
  source "$file"
done

### zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Plugins via zinit (async turbo mode)
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

zinit ice wait lucid
zinit light MichaelAquilina/zsh-you-should-use

# Oh-My-Zsh style plugin replacements
zinit ice wait lucid
zinit snippet OMZL::git.zsh

zinit ice wait lucid
zinit snippet OMZP::git

zinit ice wait lucid
zinit snippet OMZP::sudo

zinit ice wait lucid
zinit snippet OMZP::command-not-found

### Load completions (cached, rebuilt max once per day)
fpath=(~/.config/zsh/completions $fpath)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zinit cdreplay -q

### History (atuin manages sync/search; zsh keeps local fallback)
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups \
       hist_save_no_dups hist_ignore_dups hist_find_no_dups

### Quality of life options
setopt auto_cd
setopt extended_glob
setopt no_case_glob

### Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd $realpath 2>/dev/null || ls -G $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'lsd $realpath 2>/dev/null || ls -G $realpath'

### Keybindings (emacs mode; history via atuin Ctrl+R + fzf)
bindkey -e

### fastfetch — only in interactive local terminals
if [[ -o interactive ]] && [[ -z "$ZELLIJ" ]] && [[ -z "$TMUX" ]]; then
  command -v fastfetch >/dev/null && fastfetch
fi

### Runtime version manager (replaces nvm/avn)
command -v mise >/dev/null && eval "$(mise activate zsh)"

### Per-project environment variables
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

### Shell history sync & fuzzy search (replaces history-substring-search)
command -v atuin >/dev/null && eval "$(atuin init zsh)"

### Prompt
eval "$(starship init zsh)"

### Shell integrations
command -v fzf >/dev/null && eval "$(fzf --zsh)"
command -v zoxide >/dev/null && eval "$(zoxide init --cmd cd zsh)"

### Puppeteer (macOS, only if chromium is installed)
if command -v chromium >/dev/null; then
  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
  export PUPPETEER_EXECUTABLE_PATH=$(command -v chromium)
fi

### Git auto-fetch interval (OMZ git plugin)
export GIT_AUTO_FETCH_INTERVAL=1200
