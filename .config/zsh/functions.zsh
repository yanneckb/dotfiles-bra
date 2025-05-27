#####################
### Zsh Functions ###
#####################

### clear + fastfetch alias
function cl() {
  command clear
  fastfetch
}

### load-nvmrc function
load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(cat "$nvmrc_path")

    if [[ "$(nvm current)" != "v$nvmrc_node_version" ]]; then
      nvm use "$nvmrc_node_version"
    fi
  fi
}

### fast project cd
proj() {
  cd ~/repositories/$1
}
