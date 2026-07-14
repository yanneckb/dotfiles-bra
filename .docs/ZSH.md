# Zsh Configuration

## Load order

```
1. Homebrew shellenv
2. LANG, PATH dedup
3. ~/.config/zsh/*.zsh  (basic → ddev → gitlab → shopware → zellij)
4. zinit bootstrap + plugins
5. compinit + zinit cdreplay
6. History options (50 000 entries)
7. Completion styles
8. fastfetch (interactive, not in Zellij)
9. mise → direnv → atuin
10. starship → fzf → zoxide
11. Puppeteer, git auto-fetch
```

## Removed (2026 refactor)

| Removed | Replaced by |
|---------|-------------|
| nvm + avn + `load-nvmrc` | `mise` (reads `.nvmrc`, `.tool-versions`) |
| `zsh-history-substring-search` | `atuin` (`Ctrl+R`) + fzf |
| `Ctrl+P` / `Ctrl+N` history bindings | atuin / fzf |
| tmux module | zellij |

## zinit plugins

| Plugin | Effect |
|--------|--------|
| `zsh-syntax-highlighting` | Live syntax colors |
| `zsh-autosuggestions` | History suggestions |
| `zsh-completions` | Extra completions |
| `fzf-tab` | fzf completion menu |
| `git-open` / `git-extras` | Git helpers |
| `zsh-you-should-use` | Alias hints |
| `OMZL::git` / `OMZP::git` | Git aliases + auto-fetch |
| `OMZP::sudo` | Double-Esc → sudo |
| `OMZP::command-not-found` | brew install hints |

## History

- `HISTSIZE` / `SAVEHIST`: **50 000**
- **atuin** adds fuzzy search (`Ctrl+R`) and optional sync
- Register once: `atuin register`

## Key tools in `.zshrc`

| Tool | Purpose |
|------|---------|
| `mise` | Node, PHP, etc. version switching |
| `direnv` | Per-project `.envrc` |
| `atuin` | Shell history |
| `starship` | Prompt |
| `fzf` | Fuzzy finder |
| `zoxide` | Smart `cd` |

## Maintenance

```sh
source ~/.zshrc
zinit update
zinit times        # profile startup
mise install       # install tool versions from config
```
