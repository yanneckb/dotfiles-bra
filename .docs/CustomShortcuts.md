# Custom Shortcuts

Here are some custom shortcuts that are created inside `.config/zsh/*.zsh`

## Basic

### Shortcuts
| Shortcut | Description |
|----------|-------------|
| `..` | Change to parent directory |
| `...` | Change two directories up |
| `lg` | Start lazygit |
| `ls` | Use lsd for enhanced directory listing |
| `chdsk` | Show disk space information for current directory |

### Functions

| Function | Description |
|----------|-------------|
| `cl` | Clears the screen and displays fastfetch information |
| `load-nvmrc` | Automatically loads and uses the correct Node.js version from .nvmrc |
| `proj [projectname]` | Quick directory change to a project under ~/repositories/ |



## ddev

### Shortcuts
| Shortcut | Description |
|----------|-------------|
| `dstart` | Startet die DDEV-Umgebung |
| `dstop` | Stoppt die DDEV-Umgebung |
| `drestart` | Neustart der DDEV-Umgebung |
| `dssh` | SSH-Verbindung zur DDEV-Container |
| `dlog` | Zeigt die DDEV-Logs an |
| `dupdate` | Aktualisiert DDEV auf die neueste Version |
| `dbuild` | Führt das Build-Skript für JS aus |
| `dbuild-storefront` | Führt das Build-Skript für den Storefront aus |
| `dbuild-administration` | Führt das Build-Skript für die Administration aus |

### Functions
| Function | Description |
|----------|-------------|
| `ddev-updatedb` | Führt Datenbank-Migrationen aus, aktualisiert Indices, beendet System-Updates und leert den Cache |
| `ddev-watch` | Startet den Storefront-Watch-Modus für die Entwicklung |

## fzf

### Shortcuts

### Functions


## tmux shortcuts

### Shortcuts
| Shortcut | Description |
|----------|-------------|
| `t` | Start a new tmux session |
| `ta` | Attach to an existing tmux session |
| `tls` | List all tmux sessions |
| `tn` | Create a new named tmux session |
| `tks` | Kill current tmux session |
| `tksa` | Kill all tmux sessions |
| `tkss` | Kill specific tmux session |
| `tkssa` | Kill all tmux sessions except the current one |
| `tksss` | Kill specific tmux session by name |
| `tksssa` | Kill all tmux sessions except the specified one |
| `tlast` | Attach to the last tmux session |

### Functions
| Function | Description |
|----------|-------------|
| `tm` | Create or attach to a tmux session with fuzzy finding |
| `tmcd` | Create a new tmux session in the current directory |
| `tkillall` | Kill all tmux sessions and start a new one |