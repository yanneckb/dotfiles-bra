# Terminal: Ghostty & Zellij

**Ghostty** = terminal emulator · **Zellij** = multiplexer (replaces tmux)

## Ghostty (primary)

Config entry: `~/.config/ghostty/config.ghostty`

Loads optional fragments:

| File | Contents |
|------|----------|
| `appearance.conf` | Font, theme, padding |
| `behavior.conf` | Clipboard, mouse, bell |

| Shortcut | Action |
|----------|--------|
| `Cmd+T` | New tab |
| `Cmd+N` | New window |
| `Cmd+D` | Split right |
| `Cmd+Shift+D` | Split down |
| `Cmd+W` | Close |

```sh
ghostty +list-keybinds --default
ghostty +list-themes
```

## Zellij (multiplexer)

Config: `~/.config/zellij/config.kdl` (Gruvbox dark, compact layout)

| Shortcut | Action |
|----------|--------|
| `Ctrl+o` | Quick navigation |
| `Ctrl+p` | Pane switch |
| `Ctrl+n` | New pane |
| `Alt+f` | Toggle floating pane |
| `Ctrl+g` | Locked mode (default in config) |

Shell helpers: `zj`, `zja`, `zjl`, `zjcd` — see [CustomShortcuts.md](CustomShortcuts.md).

### Typical workflow

```sh
zj myproject      # create or attach session
# run dws, dwa, etc. in panes
zja myproject     # reattach later
```

## Legacy terminals

Kitty and iTerm2 configs moved to `~/.config/legacy/`. See [legacy README](../.config/legacy/README.md).

## Tips

- fastfetch is **skipped** inside Zellij (no double banner)
- Run Shopware watchers in a dedicated Zellij pane
- Ghostty clipboard: `behavior.conf` allows read/write
