# 📁 Dotfiles by yanneckb

A curated collection of configuration files to set up a productive and consistent development environment—quickly and reproducibly.

---

## ✨ Features

* Easy setup using [GNU Stow](https://www.gnu.org/software/stow/)
* Modular structure for shell, editor, and tooling
* Preconfigured themes for popular terminal emulators
* Fast onboarding for ZSH, Neovim, and tmux environments

---

## 🛠 Requirements

Install the following tools (macOS via Homebrew):

```sh
brew install fzf zsh git stow lazygit yazi starship zoxide fastfetch lsd tmux neovim
```

### Tool Breakdown

| Tool        | Purpose                            |
| ----------- | ---------------------------------- |
| `fzf`       | Fuzzy file finder                  |
| `zsh`       | Shell                              |
| `git`       | Version control                    |
| `stow`      | Symlink management                 |
| `lazygit`   | Terminal-based Git UI              |
| `yazi`      | TUI file manager                   |
| `starship`  | Fast and customizable shell prompt |
| `zoxide`    | Smarter `cd` alternative           |
| `fastfetch` | System info summary at startup     |
| `lsd`       | Modern `ls` replacement            |
| `tmux`      | Terminal multiplexer               |
| `neovim`    | Powerful text editor               |

> Optional Neovim plugins:
>
> * [NERDTree](https://github.com/preservim/nerdtree)
> * [vim-dirvish](https://github.com/justinmk/vim-dirvish)

---

### Optional (macOS): Tiling Window Manager

```sh
brew install --cask amethyst
```

* [Amethyst](https://github.com/ianyh/Amethyst): Tiling window manager for macOS

---

## 🚀 Installation

1. **Clone the repo into your home directory:**

```sh
git clone git@github.com:yanneckb/dotfiles-bra.git ~/dotfiles
cd ~/dotfiles
```

2. **Stow the configuration files:**

```sh
stow .
```

### Optional Stow Commands

* Adopt existing files (⚠️ overwrites existing config):

  ```sh
  stow --adopt .
  ```

* Remove stowed symlinks:

  ```sh
  stow -D .
  ```

* Stow individual modules:

  ```sh
  stow zsh
  stow nvim
  ```

---

## 💾 Backup & Updates

* Backup your existing configs before running `--adopt`.
* To update, pull the latest version and re-run `stow`.

---

## 🔧 Customization

* Fork this repo to create your own setup.
* Add your own modules under `.config/` and manage with `stow`.

---

## 🙏 Credits & Inspiration

* [How to manage dotfiles with GNU Stow (YouTube)](https://www.youtube.com/watch?v=y6XCebnB9gs)
* Inspired by many open source dotfiles projects

---

Happy hacking! 🧠💻🚀
