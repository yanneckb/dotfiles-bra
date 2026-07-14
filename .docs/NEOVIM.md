# Neovim & LazyVim

LazyVim-based Neovim setup with Gruvbox theme and Shopware-friendly language extras.

Config: `~/.config/nvim/`

## First launch

```sh
nvim
```

On first start, LazyVim automatically:

1. Clones `lazy.nvim` (plugin manager)
2. Downloads all plugins
3. Installs LSP servers via Mason (on first use)

Wait until sync finishes (`:Lazy` to check status).

## Leader key

**Space** (`<Space>`) is the leader key. Most shortcuts start with `Space` + something.

## Essential controls

### Modes

| Mode | How to enter | How to exit |
|------|--------------|-------------|
| Normal | Default | — |
| Insert | `i`, `a`, `o` | `Esc` or `jk` / `jj` |
| Visual | `v` (char), `V` (line) | `Esc` |
| Command | `:` | `Esc` |

### File & buffer

| Key | Action |
|-----|--------|
| `Space w` | Save file |
| `Space q` | Quit |
| `Space Q` | Quit all |
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `Space f f` | Find files (Telescope) |
| `Space f r` | Recent files |
| `Space f g` | Live grep (search in project) |
| `Space b b` | Switch buffer |
| `Space b d` | Close buffer |

### Navigation

| Key | Action |
|-----|--------|
| `h/j/k/l` | Move cursor |
| `Ctrl+h/j/k/l` | Move between windows |
| `Ctrl+Up/Down/Left/Right` | Resize window |
| `gg` | Go to first line |
| `G` | Go to last line |
| `/{pattern}` | Search forward |
| `n` / `N` | Next / previous match |
| `Esc` | Clear search highlight |

### Editing

| Key | Action |
|-----|--------|
| `u` | Undo |
| `Ctrl+r` | Redo |
| `dd` | Delete line |
| `yy` | Copy line |
| `p` | Paste |
| `cc` | Change entire line |
| `ciw` | Change inner word |
| `diw` | Delete inner word |
| `.` | Repeat last change |

### LSP (code intelligence)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover documentation |
| `Space c a` | Code action |
| `Space c r` | Rename symbol |
| `Space c f` | Format buffer |
| `[d` / `]d` | Previous / next diagnostic |

### Git (LazyGit integration)

| Key | Action |
|-----|--------|
| `Space g g` | LazyGit (if configured) |
| `]h` / `[h` | Next / previous git hunk |
| `Space g s` | Git status |
| `Space g c` | Git commit |
| `Space g b` | Git branches |

### Terminal (in Neovim)

| Key | Action |
|-----|--------|
| `Ctrl+\` | Toggle terminal |
| `Esc Esc` | Exit terminal mode |

### Plugin management

| Command | Action |
|---------|--------|
| `:Lazy` | Plugin manager UI |
| `:Lazy sync` | Install/update plugins |
| `:Lazy health` | Health check |
| `:Mason` | LSP server installer |

## Custom keymaps (this config)

Defined in `lua/config/keymaps.lua`:

| Key | Action |
|-----|--------|
| `jk` / `jj` | Exit insert mode |
| `Ctrl+h/j/k/l` | Window navigation |
| `Space w` | Save |
| `Space q` | Quit |

## Installed extras (Shopware stack)

Via `lua/plugins/shopware.lua`:

- PHP (phpactor LSP)
- TypeScript
- JSON
- Neo-tree (file explorer)
- Prettier formatting
- ESLint linting

## Customization

| File | Purpose |
|------|---------|
| `lua/plugins/*.lua` | Add or override plugins |
| `lua/config/options.lua` | Editor options |
| `lua/config/keymaps.lua` | Custom keymaps |
| `lua/plugins/gruvbox.lua` | Gruvbox Hard colorscheme |

Example — add a plugin:

```lua
-- lua/plugins/myplugin.lua
return {
  { "author/plugin-name", opts = {} },
}
```

Then `:Lazy sync`.

## Tips for beginners

1. Start with `Space f f` to open files and `Space` + `?` for which-key help.
2. Use `K` on any function to read documentation.
3. Use `:Telescope find_files` if you forget the shortcut.
4. Run `:checkhealth` if something does not work.
5. LazyVim docs: https://www.lazyvim.org/

## Gruvbox

Matches terminal theme (Ghostty Gruvbox Dark Hard). Colorscheme set in `lua/plugins/gruvbox.lua`.
