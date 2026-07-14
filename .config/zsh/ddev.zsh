######################
### Zsh Ddev Config ###
######################

# --- Aliases ---
### ddev basics
alias dstart="ddev start"
alias dstop="ddev stop"
alias drestart="ddev restart"
alias dssh="ddev ssh"
alias dlog="ddev logs"
alias dupdate="curl -fsSL https://raw.githubusercontent.com/ddev/ddev/master/scripts/install_ddev.sh | bash && ddev --version"

### ddev shopware commands
alias dc="ddev exec bin/console"
alias dcc="ddev exec bin/console cache:clear"
alias dccf="ddev exec bin/console cache:clear && rm -rf var/cache/*"
alias dba="ddev exec bin/build-administration.sh"
alias dbs="ddev exec bin/build-storefront.sh"
alias dbas="ddev exec bin/build-administration.sh && ddev exec bin/console cache:clear"
alias dbsc="ddev exec bin/build-storefront.sh && ddev exec bin/console cache:clear"
alias dwa="ddev exec bin/watch-administration.sh"
alias dws="ddev exec bin/watch-storefront.sh"
alias dct="ddev exec bin/console theme:compile"
alias dpr="ddev exec bin/console plugin:refresh"

# --- Functions ---
ddev-updatedb() {
  ddev exec bin/console database:migrate --all
  ddev exec bin/console dal:refresh:index
  ddev exec bin/console system:update:finish
  ddev exec bin/console cache:clear
  ddev exec bin/console theme:compile
}

ddev-watch() {
  ddev exec bin/build-storefront.sh
  ddev exec bin/console cache:clear
  ddev exec bin/watch-storefront.sh
}