unsetopt correct_all

export PATH="/home/jshelly/.config/sway:$PATH"
export EDITOR="nvim"
bindkey -e # to override zshrc to using vim, therefore to mitigate running vim, inside vim, inside vim.
export XDG_CONFIG_HOME="$HOME/.config"
export FZF_DEFAULT_COMMAND='find .'

# adding MyScripts to path
export PATH="$HOME/.local/MyScripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# adding gazprea scripts

# adding cargo bin stuff to path
export PATH=/home/jshelly/.cargo/bin:$PATH

# Sourcing antigen
source $HOME/.config/antigen.zsh

# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

# Auto-suggestions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z

# zsh-utils 
antigen use belak/zsh-utils

# better ctrl+w
custom-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N custom-backward-delete-word
bindkey '^W' custom-backward-delete-word

# NEVER DO antigen bundle editor. It messes up with upward history search thingy!!
antigen bundle history # enables history
# antigen bundle utility # idk
# antigen bundle zsh-users/zsh-history-substring-search

# up / down arrows search command-wise history 
bindkey '^[OP' end-of-line
# bindkey '\e[A' history-beginning-search-backward
# bindkey '\e[B' history-beginning-search-forward
bindkey '^k' history-beginning-search-backward
bindkey '^j' history-beginning-search-forward

# ctrl + left / right arrows go one word backward / forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# alt + L to clear the terminal

# unbinding C-L
# bindkey -r "^l"
# bindkey "^[l" clear-screen


# syntax highlighting (and colors)
antigen bundle zsh-users/zsh-syntax-highlighting

# colored man pages
antigen bundle ael-code/zsh-colored-man-pages

# tab completion colors
zstyle ':completion:*' list-colors “${(s.:.)LS_COLORS}”
# zstyle ':completion:*' menu select

antigen apply
autoload -U compinit; compinit


# some keybinds
bindkey '^H' backward-kill-word # ctrl backspace
bindkey '5~' kill-word # ctrl delete
bindkey "^[[3~" delete-char # delete

# Aliases
alias fixkeys='sudo pacman -Sy archlinux-keyring endeavouros-keyring'
alias ru='evcxr'
alias htop='btop'
alias cat='bat'
alias ls='lsd'
alias exa='exa --classify'
alias vim='nvim'
alias lsa='ls -a'
alias l='ls -la --header'
alias ll='ls -l --header'
alias llt='ls -l --header -t'
alias cp='cp -i'                                                # Confirm before overwriting something
alias dt='d $TERM'
alias diff='difft'
alias pwd='pwd -P'
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias dudir='dust'
alias books='cd ~/Stuff/Books'
alias cdfzf='cd `dirname $(fzf)`'
alias pinfo='info'

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{yellow}(%b)%f'
zstyle ':vcs_info:svn:*' formats ' %F{yellow}(%b)%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%f%B%F{45}[%f%b%B%F{45}%n%f%b%B%F{45}]%f%b%F{red}%(?.. [%?])%f${vcs_info_msg_0_} %F{44}$ %f'

# initial RPROMPT (on opening the terminal)
RPROMPT="%F{140}$(pwd)%f%F{226}"
# symlink resolution for symlinked directories
function chpwd() {
  RPROMPT="%F{140}$(pwd)%f%F{226}"
}

# aliasis
alias rp='realpath'
alias py='python3 -i ~/.local/MyScripts/py_alias_starter.py'
alias paclog='bat /var/log/pacman.log'
alias cls='clear'
alias mars='d java -jar ~/.local/bin/Mars4_5.jar'
alias sshuni='ssh jyotirma@coronation.cs.ualberta.ca'
alias sshuniug='ssh jyotirma@ug11.cs.ualberta.ca'
alias sshunix='ssh -X jyotirma@ohaton.cs.ualberta.ca'
alias batteryinfo='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias g='f() { gcc -std=c99 -Wall $1.c -o $1 };f'
alias kys='shutdown now'
alias eclass='brave-browser https://eclass.srv.ualberta.ca/my/ &; disown; exit;'
alias ocr='bash ~/.local/MyScripts/screen_ts.sh'
alias xxclip='xclip -selection clipboard'
alias gitrepo='git config --get remote.origin.url'
alias open='d xdg-open'
alias o='open'
alias neofetch='clear && neofetch'
alias uni='cd ~/Stuff/Career/UNI'
alias unisem='cd /home/jshelly/Stuff/Career/UNI/Coursework-and-Course-Material/Year-5/Fall'
alias myrepos='cd ~/Stuff/My-Repos'
alias grep='rg'
#----Some more settings----

# case insensitive cd
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

#--- custom functions ---
d() {$* &; disown}
run() {$* &; disown; exit}
compdef d=exec
compdef run=exec

# open and kill terminal
ok() {
    d xdg-open $1;
    exit;
}
export PATH="$PATH:$HOME/.spicetify"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

setopt AUTO_PUSHD
setopt pushdminus

cda() {
    path_or_error=$(cda-bin "$@")
    if [ $? -eq 0 ]; then   # Path
        cd $path_or_error
    else                    # Err
        echo $path_or_error
    fi
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# For QNX
# pushd "/home/jshelly/qnx/installs/SDP8" > /dev/null
# source qnxsdp-env.sh > /dev/null
# popd > /dev/null
#
# export PYTHONPATH="/home/jshelly/Stuff/Career/UNI/Coursework-and-Course-Material/Year-5/Winter/CMPUT-429/429-resources/gem5/src/python/gem5"


# CMPUT 429 Environment variables
export C429_RESOURCES=/home/jshelly/Stuff/Career/UNI/Coursework-and-Course-Material/Year-5/Winter/CMPUT-429/429-resources
export GEM_PATH=$C429_RESOURCES/gem5
export GEM_CONFIGS=$C429_RESOURCES/gem5/configs
export GEM_TESTS=$C429_RESOURCES/gem5/tests
export GEM5_CONFIG=$C429_RESOURCES/local_resources/sources.json
export CC=clang
export CXX=clang++
alias gem5=$GEM_PATH/build/RISCV/gem5.opt
alias x86gem5=$GEM_PATH/build/X86/gem5.opt
