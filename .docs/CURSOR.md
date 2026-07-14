# Cursor / VS Code Configuration

Shared editor defaults for Shopware and frontend projects. Stowed to `~/.cursor/config/`.

## Synced config files

| File | Purpose |
|------|---------|
| `.prettierrc.js` | Prettier (Twig, Vue, SCSS overrides) |
| `.eslintrc.js` | ESLint rules |
| `.eslintignore` | ESLint ignore patterns |
| `stylelint.config.js` | Stylelint for CSS/SCSS |
| `.stylelintignore` | Stylelint ignore patterns |
| `tsconfig.json` | Base TypeScript config |

## Not synced

`extensions.json` is listed in `.stow-local-ignore` because it contains machine-specific install paths and changes frequently.

Install extensions manually or via Cursor's extension sync.

## Recommended extensions

Core development:

- `dbaeumer.vscode-eslint` — ESLint
- `esbenp.prettier-vscode` — Prettier
- `stylelint.vscode-stylelint` — Stylelint
- `vue.volar` — Vue / TypeScript
- `jdinhlife.gruvbox` — Gruvbox theme
- `pkief.material-icon-theme` — File icons

Shopware / PHP:

- `whatwedo.twig` / `mblode.twig-language-2` — Twig support

Git / workflow:

- `eamodio.gitlens` — Git insights
- `gitlab.gitlab-workflow` — GitLab integration
- `mhutchie.git-graph` — Git graph

Quality:

- `deque-systems.vscode-axe-linter` — Accessibility linting
- `usernamehw.errorlens` — Inline diagnostics

## Usage in projects

Copy or extend configs per project. These dotfiles provide sensible defaults; project-level `.eslintrc` / `.prettierrc` take precedence when present.
