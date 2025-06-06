## 🖥️ Terminal Splits, Tabs & Windows

### 📦 Using `tmux` (Recommended)

#### 👉 Windows = Tabs

A "window" in `tmux` acts like a tab in a regular terminal app.

| Command                   | Description                   |
| ------------------------- | ----------------------------- |
| `tmux new-window`         | Open a new window             |
| `tmux rename-window`      | Rename the current window     |
| `tmux select-window -t N` | Switch to window N            |
| `tmux last-window`        | Switch to the previous window |

#### 👉 Panes = Splits (Horizontal / Vertical)

| Shortcut            | Description                     |
| ------------------- | ------------------------------- |
| `Ctrl + b`, `%`     | Split vertically (left/right)   |
| `Ctrl + b`, `"`     | Split horizontally (top/bottom) |
| `Ctrl + b`, `o`     | Switch between panes            |
| `Ctrl + b`, `x`     | Close active pane               |
| `Ctrl + b`, `q`     | Show pane numbers               |
| `Ctrl + b`, `Arrow` | Move between panes using arrows |

#### 👉 Tabs & Splits Combined

* `Ctrl + b`, `c` → new window (tab)
* `Ctrl + b`, `%` or `"` → split current window

#### Bonus: Save tmux sessions (via `tmux-resurrect`)

Optionally use the plugin to save and restore sessions.

---

### 🧭 Terminal Tabs (Without tmux)

If you're using **iTerm2** or **Kitty**, these support tabs and splits natively.

#### iTerm2 (macOS)

| Shortcut               | Action                  |
| ---------------------- | ----------------------- |
| `Cmd + t`              | New tab                 |
| `Cmd + d`              | Split vertically        |
| `Cmd + Shift + d`      | Split horizontally      |
| `Cmd + Option + Arrow` | Navigate between splits |
| `Cmd + w`              | Close tab or split      |

#### Kitty

| Shortcut               | Action             |
| ---------------------- | ------------------ |
| `Ctrl + Shift + Enter` | New tab            |
| `Ctrl + Shift + D`     | Split vertically   |
| `Ctrl + Shift + E`     | Split horizontally |
