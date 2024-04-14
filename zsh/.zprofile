# ANTLR stuff
# adding antlrv4 for the cmput 415 course
export ANTLR_INS="/home/jshelly/antlr/antlr4-install"
# C415 ANTLR generator.
export CLASSPATH="/home/jshelly/antlr/antlr4-install/bin/antlr-4.10.1-complete.jar:$CLASSPATH"
alias antlr4="java -Xmx500M org.antlr.v4.Tool"
alias grun='java org.antlr.v4.gui.TestRig'
# C415 testing utility.
export PATH="$HOME/Tester/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"

export PATH="$HOME/jshelly/.local/share/nvim/mason/packages/haskell-language-server/bin:$PATH"
export PATH="$HOME/.ghcup/:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
