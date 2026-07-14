# Tools & Stack Reference

## Stack overview

```
Ghostty → Zsh → mise + direnv + atuin
                  ├── zinit plugins
                  ├── Starship
                  ├── fzf / zoxide / bat / rg / fd
                  └── Modules (basic, ddev, gitlab, shopware, zellij)
Neovim (LazyVim) — parallel editor path
```

## New stack (2026)

| Tool | Replaces | Purpose |
|------|----------|---------|
| **mise** | nvm, avn | Node, PHP, runtime versions |
| **direnv** | global exports | Per-project `.envrc` |
| **atuin** | plain history | Fuzzy history + sync |
| **delta** | plain git diff | Colored side-by-side diffs |
| **glab** | — | GitLab CLI |
| **bat** | cat | Syntax-highlighted output |
| **ripgrep** | grep | Fast search |
| **fd** | find | Fast file find |
| **zellij** | tmux | Multiplexer |

Install all: `~/dotfiles/scripts/bootstrap.sh`

## Terminal: Ghostty

| File | Purpose |
|------|---------|
| `config.ghostty` | Entry, loads fragments |
| `appearance.conf` | Font, Gruvbox theme |
| `behavior.conf` | Clipboard, mouse |

## Multiplexer: Zellij

Config: `~/.config/zellij/config.kdl`

Helpers: `zj`, `zja`, `zjcd` in `zellij.zsh`

## zinit plugins

See [ZSH.md](ZSH.md) for full list. Loaded async (`wait lucid`).

## CLI tools

| Tool | Config | Alias |
|------|--------|-------|
| bat | `~/.config/bat/config` | `cat`, `less` |
| ripgrep | — | `grep` |
| fd | — | `find` |
| lsd | `~/.config/lsd/config.yaml` | `ls`, `la` |
| fzf | shell integration | `Ctrl+R/T`, `Alt+C` |
| zoxide | shell integration | `cd` |
| lazygit | — | `lg` |
| yazi | `~/.config/yazi/yazi.toml` | — |
| fastfetch | — | startup banner |
| starship | `~/.config/starship.toml` | prompt |

## Git

| Component | Config |
|-----------|--------|
| delta | `~/.gitconfig` `[delta]` section |
| lazygit | `lg` alias |
| glab | `gitlab.zsh` aliases |
| git-open | `git open` in browser |

Personal identity: `~/.gitconfig.local` (see `.gitconfig.local.example`)

## Node / PHP (mise)

Config: `~/.config/mise/config.toml`

Reads `.nvmrc`, `.node-version`, `.tool-versions` automatically.

```sh
mise use node@22        # per directory
mise use -g node@lts    # global
mise trust <path>       # trust config
```

## DDEV & Shopware

Aliases in `ddev.zsh`. shopware-cli + mkcert in `shopware.zsh`.

See [SHOPWARE.md](SHOPWARE.md) for mkcert, mutagen, shopware-cli notes.

## Neovim / LazyVim

Config: `~/.config/nvim/`

See [NEOVIM.md](NEOVIM.md) for keybindings and first-launch setup.

## Editor (Cursor)

`~/.cursor/config/` — see [CURSOR.md](CURSOR.md)

Extension IDs: `.cursor/extensions/extensions.txt`

## External tools (evaluate separately)

- [just](https://github.com/casey/just) — command runner / Makefile alternative
- [watchexec](https://github.com/watchexec/watchexec) — run command on file change

## Install one-liner

```sh
brew bundle --file=~/dotfiles/Brewfile && cd ~/dotfiles && stow -R .
```
