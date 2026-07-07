########################
### Shopware Aliases ###
########################

alias sw-console="bin/console"
alias sw-cc="bin/console cache:clear"
alias sw-cc-full="bin/console cache:clear && rm -rf var/cache/*"
alias sw-build-admin="bin/build-administration.sh"
alias sw-build-storefront="bin/build-storefront.sh"
alias sw-watch-admin="bin/watch-administration.sh"
alias sw-watch-storefront="bin/watch-storefront.sh"
alias sw-theme-compile="bin/console theme:compile"
alias sw-plugin-refresh="bin/console plugin:refresh"

alias ddev-console="ddev exec bin/console"
alias ddev-cc="ddev exec bin/console cache:clear"
alias ddev-cc-full="ddev exec bin/console cache:clear && rm -rf var/cache/*"
alias ddev-build-admin="ddev exec bin/build-administration.sh"
alias ddev-build-storefront="ddev exec bin/build-storefront.sh"
alias ddev-watch-admin="ddev exec bin/watch-administration.sh"
alias ddev-watch-storefront="ddev exec bin/watch-storefront.sh"
alias ddev-theme-compile="ddev exec bin/console theme:compile"
alias ddev-plugin-refresh="ddev exec bin/console plugin:refresh"