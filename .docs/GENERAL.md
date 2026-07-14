# General Reference

Essential commands and setup notes for the development environment.

## Git

### Initialize a repository

```sh
git init
git remote add origin git@github.com:yanneckb/dotfiles-bra.git
git remote -v
```

### Sync with remote

```sh
git pull origin main
git push origin main
```

## Archives

### Create tar.gz

```sh
tar czvf /path/to/backup.tar.gz -C /path/to/source .
```

### Extract tar.gz

```sh
tar xzvf /path/to/backup.tar.gz -C /destination/path
```

## SSH keys

```sh
ssh-keygen -t ed25519 -C "your@email.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com
```

Add the public key to GitHub: [SSH key docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

## Symlinks

GNU Stow manages symlinks automatically. For manual links:

```sh
ln -s /path/to/source /path/to/destination
```

### Adopt existing config into dotfiles

```sh
cd ~/dotfiles
stow --adopt .
```

Back up existing files before using `--adopt`.

## Dotfiles maintenance

```sh
cd ~/dotfiles
git pull
stow -R .
```

Preview without changes:

```sh
stow -n -v .
```

Remove symlinks:

```sh
stow -D .
```

## Bootstrap

```sh
~/dotfiles/scripts/bootstrap.sh
```

Installs Homebrew packages, stows dotfiles, trusts mise config.

## Node.js (mise)

Replaces nvm. Config: `~/.config/mise/config.toml`

```sh
mise trust ~/.config/mise/config.toml
mise install
mise use node@22    # example
```

Reads `.nvmrc` in project directories automatically.

## Shell history (atuin)

```sh
atuin register      # once
atuin sync          # optional sync
```

Search history: `Ctrl+R`

## Git identity

```sh
cp ~/dotfiles/.gitconfig.local.example ~/.gitconfig.local
# edit name and email
```

## DDEV

```sh
brew install ddev/ddev/ddev
ddev config
ddev start
```

See [CustomShortcuts.md](CustomShortcuts.md) for project aliases.
