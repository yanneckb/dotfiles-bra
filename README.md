# Dotfiles

Personal dotfiles for a reproducible macOS development setup. Managed with [GNU Stow](https://www.gnu.org/software/stow/) and optimized for Shopware/DDEV workflows at Brandung.

## Quick start

```sh
git clone git@github.com:yanneckb/dotfiles-bra.git ~/dotfiles
~/dotfiles/scripts/bootstrap.sh
```

## What's included

| Area | Path | Description |
|------|------|-------------|
| Shell | `.zshrc`, `.config/zsh/` | Zsh with zinit, mise, direnv, atuin |
| Terminal | `.config/ghostty/` | Ghostty (primary) — Gruvbox Dark Hard |
| Multiplexer | `.config/zellij/` | Zellij sessions (replaces tmux) |
| Editor | `.config/nvim/` | Neovim + LazyVim |
| Git | `.gitconfig` | Delta diffs, aliases |
| Prompt | `.config/starship.toml` | Gruvbox-themed Starship prompt |
| Tools | `.config/lsd/`, `.config/yazi/`, `.config/bat/` | Enhanced CLI tools |
| Cursor | `.cursor/config/` | ESLint, Prettier, Stylelint defaults |
| Legacy | `.config/legacy/` | Old Kitty/iTerm2 configs |

Docs: [`.docs/`](.docs/README.md) · Tool reference: [`.docs/TOOLS.md`](.docs/TOOLS.md)

## Requirements

Install everything via bootstrap or manually:

```sh
brew bundle --file=~/dotfiles/Brewfile
```

Core tools: `mise`, `direnv`, `atuin`, `delta`, `glab`, `bat`, `rg`, `fd`, `zellij`, `fzf`, `zoxide`, `lsd`, `lazygit`, `starship`, `ghostty`, `neovim`, `ddev`

## Installation

```sh
git clone git@github.com:yanneckb/dotfiles-bra.git ~/dotfiles
cd ~/dotfiles
./scripts/bootstrap.sh
```

Or manually:

```sh
stow .
mise trust ~/.config/mise/config.toml
atuin register   # once, for history sync
```

## Repository structure

```
dotfiles/
├── .zshrc
├── .gitconfig
├── Brewfile
├── scripts/bootstrap.sh
├── .config/
│   ├── zsh/           # modular shell (basic, ddev, gitlab, shopware, zellij)
│   ├── ghostty/       # terminal (split configs)
│   ├── zellij/        # multiplexer
│   ├── nvim/          # LazyVim
│   ├── mise/          # runtime versions (node, php)
│   ├── bat/, lsd/, yazi/, direnv/
│   ├── starship.toml
│   └── legacy/        # kitty, iterm2 (reference only)
├── .cursor/config/
├── .docs/
└── README.md
```

## Shell modules

| Module | Purpose |
|--------|---------|
| `basic.zsh` | bat/rg/fd aliases, `proj()`, navigation |
| `ddev.zsh` | DDEV + Shopware shortcuts |
| `gitlab.zsh` | GitLab CLI (`glab`) aliases |
| `shopware.zsh` | shopware-cli, mkcert aliases |
| `zellij.zsh` | Zellij session helpers |

Integrations in `.zshrc`: zinit, mise, direnv, atuin, starship, fzf, zoxide

- [Custom Shortcuts](.docs/CustomShortcuts.md)
- [Tools & Stack](.docs/TOOLS.md)
- [Zsh Deep Dive](.docs/ZSH.md)
- [Neovim / LazyVim](.docs/NEOVIM.md)

## DDEV / Shopware

| Alias | Command |
|-------|---------|
| `dstart` / `dstop` / `drestart` | DDEV lifecycle |
| `dc` | `ddev exec bin/console` |
| `dba` / `dbs` | Build administration / storefront |
| `dwa` / `dws` | Watch administration / storefront |
| `swc` | shopware-cli (if installed) |

## Updates

```sh
cd ~/dotfiles && git pull && stow -R .
```

## Customization

- `PROJ_DIR` env var overrides `~/repositories/` for `proj()`
- `~/.gitconfig.local` for personal git identity (not in dotfiles)
- New shell module: add `.config/zsh/myfeature.zsh`

## Credits

- [GNU Stow](https://www.gnu.org/software/stow/), [LazyVim](https://www.lazyvim.org/), Gruvbox theme
