# 📚 General Documentation

This document collects essential commands, setup instructions, and tips for my personal development environment.

---

## 🔧 Git Basics

### Initialize a New Repository

```sh
git init
```

### Add a Remote Repository

```sh
git remote add origin git@github.com:yanneckb/dotfiles-bra.git
```

Verify remote:

```sh
git remote -v
```

### Push to Remote Repository

```sh
git push origin master
```

### Pull from Remote Repository

```sh
git pull origin master
```

---

## 🗜️ Zip and Unzip Archives

### Create a Compressed Archive (tar.gz)

```sh
tar czvf /path/to/destination/backup.tar.gz -C /path/to/target-files .
```

* `-c`: create archive
* `-z`: gzip compression
* `-v`: verbose output
* `-f`: specify file name
* `-C`: change to directory before archiving

### Extract a Compressed Archive

```sh
tar xzvf /path/to/backup.tar.gz -C /destination/path
```

* `-x`: extract files
* `-z`: gzip decompression
* `-v`: verbose output
* `-f`: specify file name
* `-C`: change to target directory

---

## 🔐 SSH Key Setup

1. Generate a new SSH key (using Ed25519):

   ```sh
   ssh-keygen -t ed25519 -C "email@address.com"
   ```

2. Start the ssh-agent:

   ```sh
   eval "$(ssh-agent -s)"
   ```

3. Add your SSH private key to the agent:

   ```sh
   ssh-add ~/.ssh/id_ed25519
   ```

4. Display your public key:

   ```sh
   cat ~/.ssh/id_ed25519.pub
   ```

5. Copy the output and add the public key to your GitHub account ([GitHub SSH docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)).

6. Test the connection:

   ```sh
   ssh -T git@github.com
   ```

---

## 🔗 Creating Symlinks

### Basic Symlink Command

```sh
ln -s /path/to/source /path/to/destination
```

### Moving a File/Directory and Creating a Symlink

```sh
mv /path/to/source /path/to/destination
ln -s /path/to/destination /path/to/source
```
