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
alias dbuild="ddev exec bin/build-js.sh"
alias dbuild-storefront="ddev exec bin/build-storefront.sh"
alias dbuild-administration="ddev exec bin/build-administration.sh"

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