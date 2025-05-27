# General documentation

This is a collection of documentation for my personal setup, tools and useful commands.

## Git
- create a new repository
- add a new remote
  - `git remote add origin git@github.com:yanneckb/dotfiles-bra.git`
  - `git remote -v`
- push to remote
  - `git push origin master`
- pull from remote
  - `git pull origin master`



## Zip and Unzip
- zip: `tar czvf /path/to/destination/backup.tar.gz -C /path/to/target-files .`
- unzip: `tar xzvf /path/to/backup.tar.gz -C /destination/path`

## SSH setup
- `ssh-keygen -t ed25519 -C "email@address.com"`
- `eval "$(ssh-agent -s)"`
- `ssh-add ~/.ssh/id_ed25519`
- `cat ~/.ssh/id_ed25519.pub`
- copy pub key and add to github account
- test ssh with `ssh -T git@github.com`

## Create symlinks
- `ln -s /path/to/source /path/to/destination`

or:
- `mv /path/to/source /path/to/destination`
- `ln -s /path/to/destination /path/to/source`