# Custom Shortcuts

## Basic (`basic.zsh` + `functions/basics.zsh`)

### CLI aliases

| Shortcut | Tool | Description |
|----------|------|-------------|
| `cat` | bat | Syntax-highlighted file view |
| `less` | bat | Paged file view |
| `grep` | ripgrep (`rg`) | Fast content search |
| `find` | fd | Fast file search |
| `ls` / `la` | lsd (fallback: eza) | Icons + colors |
| `..` / `...` | cd | Up 1 / 2 directories |
| `lg` | lazygit | Git TUI |
| `c` | clear | Clear screen |
| `chdsk` | df | Disk space |

### Functions

| Function | Description |
|----------|-------------|
| `cl` | Clear + fastfetch |
| `proj [name]` | Jump to project; fzf picker without args |
| `rep <alias>` | Jump to mapped repo (`schwalbe`, `jpt`, …) |

Set `PROJ_DIR` in `local.zsh` to override `~/repositories/`.

Repo aliases for `rep` live in `~/dotfiles/local.zsh` (not tracked). Copy from `local.zsh.example`.

## GitLab (`gitlab.zsh`)

Requires `glab`. Only loaded if installed.

| Shortcut | Description |
|----------|-------------|
| `mrc` | Create merge request |
| `mrv` | View MR |
| `mrl` | List MRs |
| `mrd` | MR diff |
| `il` / `ic` / `iv` | Issues list/create/view |
| `ci` / `cil` / `pipe` | CI view/list/trace |

## Shopware (`shopware.zsh`)

| Shortcut | Description |
|----------|-------------|
| `swc` | shopware-cli |
| `swc-build` | storefront-build |
| `mkcert-install` | `mkcert -install` (one-time) |

## DDEV (`ddev.zsh`)

See [README](../README.md#ddev--shopware) for full list.

## Zellij (`zellij.zsh`)

| Shortcut | Description |
|----------|-------------|
| `zj [name]` | Create or attach session |
| `zja` | Attach to session |
| `zjl` | List sessions |
| `zjk` | Kill session |
| `zjka` | Kill all sessions |
| `zjcd` | New session named after current directory |
| `zjkillall` | Kill all sessions (loop) |

## Integrations (`.zshrc`)

| Tool | Key / trigger |
|------|---------------|
| atuin | `Ctrl+R` fuzzy history |
| fzf | `Ctrl+R`, `Ctrl+T`, `Alt+C` |
| zoxide | `cd <dir>` smart jump |
| mise | Auto-switch Node/PHP per `.nvmrc` / `.tool-versions` |
| direnv | Auto-load `.envrc` per project |
