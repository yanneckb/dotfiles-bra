# Theme Setup

Consistent **Gruvbox Hard** palette and **JetBrains Mono Nerd Font** across tools.

## Font

**JetBrains Mono Nerd Font** — ligatures, Nerd Font icons, Powerline symbols.

```sh
brew install --cask font-jetbrains-mono-nerd-font
```

Set in: Ghostty, Cursor/VS Code. (Kitty/iTerm2 optional/legacy.)

## Gruvbox Hard

High-contrast warm palette. Applied in:

| Tool | Config / Source |
|------|-----------------|
| **Ghostty** | `~/.config/ghostty/config.ghostty` (theme: Gruvbox Dark Hard) |
| **Kitty** | `~/.config/kitty/kitty.conf` (legacy) |
| **iTerm2** | `~/.config/iterm2/themes/gruvbox-hard.itermcolors` (legacy) |
| **Starship** | `~/.config/starship.toml` (`palette = 'gruvbox_dark'`) |
| **Cursor** | Extension: [Gruvbox Theme](https://marketplace.visualstudio.com/items?itemName=jdinhlife.gruvbox) |

### Optional references

| Application | Link |
|-------------|------|
| Neovim | [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) |
| Starship preset | [Gruvbox Rainbow](https://starship.rs/presets/gruvbox-rainbow) |
| Chrome | [Gruvbox Chrome Theme](https://chrome.google.com/webstore/detail/gruvbox-theme/ihennfdbghdiflogeancnalflhgmanop) |
| Wallpapers | [gruvbox-wallpapers.pages.dev](https://gruvbox-wallpapers.pages.dev/) |

## Starship

Active prompt config: `~/.config/starship.toml`

- Gruvbox dark palette with segment colors
- Shows OS, user, path, git status, language versions, Docker context, time

Legacy/unused configs (`starship.yoml`, `oh-my-posh.conf.json`) were removed.

## Consistency checklist

- [ ] Terminal font → JetBrainsMono Nerd Font (Ghostty)
- [ ] Terminal colors → Gruvbox Dark Hard
- [ ] Editor theme → Gruvbox
- [ ] Starship prompt → matches palette
- [ ] `lsd` icons → Nerd Font required
