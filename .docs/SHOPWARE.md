# Shopware, mkcert & DDEV Performance

Notes for tools you already have installed — what to configure in dotfiles vs. per project.

## shopware-cli

**No global config file required.** The CLI works out of the box.

Dotfiles provide:

| Alias | Command |
|-------|---------|
| `swc` | `shopware-cli` |
| `swc-build` | `shopware-cli project storefront-build` |

Per-project config (optional): `.shopware-cli.yml` in the project root for build/deploy settings.

Docs: https://github.com/shopware/shopware-cli

## mkcert

**One-time system setup**, not a dotfiles config:

```sh
mkcert -install   # or alias: mkcert-install
```

Creates a local CA in your system keychain. Per-project certs:

```sh
mkcert myproject.ddev.site localhost 127.0.0.1
```

DDEV can integrate mkcert automatically when `mkcert` is in PATH — no extra dotfiles config needed.

## DDEV Mutagen

### Should you enable it?

**Often no** — especially if you felt it was slow.

| Scenario | Recommendation |
|----------|----------------|
| macOS + many small files (Shopware) | Default bind mount is usually faster |
| Mutagen feels sluggish / high CPU | **Disable** — `mutagen_enabled: false` in `.ddev/config.yaml` |
| Remote Docker / NFS issues | Try Mutagen as experiment, measure |

### Why Mutagen can feel slow

- Initial sync of large `vendor/`, `node_modules/`, `var/` takes time
- Continuous two-way sync causes CPU/IO overhead
- Shopware projects have thousands of files — Mutagen shines on smaller codebases

### Better alternatives for Shopware on macOS

1. **Default bind mounts** (DDEV default) — good enough for most work
2. **Exclude heavy dirs** from sync/watchers, not from the container
3. **Run builds inside container** (`ddev exec`) — you already do this
4. **NFS** (DDEV `nfs_mount_enabled`) — sometimes faster than Mutagen, sometimes not

### When Mutagen helps

- Docker filesystem is on a remote host
- Bind mounts have known latency issues on your machine
- You measured faster `ddev start` + file save after initial sync

### Recommendation

Keep Mutagen **disabled** unless you benchmark a real improvement:

```yaml
# .ddev/config.yaml (per project, not dotfiles)
mutagen_enabled: false
```

Use watchers (`dws`, `dwa`) inside DDEV instead of syncing `node_modules` to the host.

## direnv for Shopware projects

Recommended per-project `.envrc` (not in dotfiles):

```sh
# .envrc
export SHOPWARE_SKIP_THEME_COMPILE=1
# export NODE_ENV=development
```

Then: `direnv allow`

Keeps project-specific env out of global `.zshrc`.
