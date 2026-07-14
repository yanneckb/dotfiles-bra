############################
### Shopware / mkcert ###
############################

if command -v shopware-cli >/dev/null; then
  alias swc='shopware-cli'
  alias swc-build='shopware-cli project storefront-build'
fi

if command -v mkcert >/dev/null; then
  alias mkcert-install='mkcert -install'
fi
