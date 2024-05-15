export PATH="$HOME/jshelly/.local/share/nvim/mason/packages/haskell-language-server/bin:$PATH"
export PATH="$HOME/.ghcup/:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
