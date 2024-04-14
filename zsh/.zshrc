# PLEASE ADD STUFF FROM ZSHRC TO SOME OTHER RC THINGY LIKE XINIT OR ZSHENV THINGY YES
# Use powerline USE_POWERLINE="true"

# Setting the locale (there prolly should be a better way to do this)
# alias setloc='unset LANG; source /etc/profile.d/locale.sh;'

unsetopt correct_all

# # This is to fix terminal being messed up on resizing on tiling window manager (awesome wm)
# export PROMPT_COMMAND="resize &>/dev/null ; $PROMPT_COMMAND"

export PATH="/home/jshelly/.config/sway:$PATH"
export EDITOR="nano"
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
alias cp='cp -i'                                                # Confirm before overwriting something
alias dt='d $TERM'
alias diff='difft'
alias pwd='pwd -P'
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias dudir='dust'
alias books='cd ~/Stuff/Books'
alias cfgcd='cd ~/.steam/root/userdata/1221160438/730/local/cfg'
alias cdfzf='cd `dirname $(fzf)`'
# alias z='zoxide'
# z() {zoxide $1}
# compdef z=cd

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
# alias touche='flatpak run com.github.joseexposito.touche'
# alias rungpu='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias py='python3 -i ~/.local/MyScripts/py_alias_starter.py'
alias paclog='bat /var/log/pacman.log'
alias cls='clear'
alias mars='d java -jar ~/.local/bin/Mars4_5.jar'
# alias mc='rungpu java -jar /opt/Minecraft/TLauncher-2.75.jar'
# alias unity='/home/jshelly/Unity/UnityHub.AppImage'
alias sshuni='ssh jyotirma@coronation.cs.ualberta.ca'
alias sshuniug='ssh jyotirma@ug11.cs.ualberta.ca'
alias sshunix='ssh -X jyotirma@ohaton.cs.ualberta.ca'
alias batteryinfo='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias risc='d java -jar /opt/rars/rars.jar'
alias g='f() { gcc -std=c99 -Wall $1.c -o $1 };f'
alias kys='shutdown now'
alias eclass='brave-browser https://eclass.srv.ualberta.ca/my/ &; disown; exit;'
alias ocr='bash ~/.local/MyScripts/screen_ts.sh'
alias xxclip='xclip -selection clipboard'
#alias fzf='fzf | xclip -sel clip'
alias gitrepo='git config --get remote.origin.url'
# alias clion='d /opt/clion-2021.1.2/bin/clion.sh'
#alias afk='~/.local/MyScripts/afkscript_manager.sh'
# alias open='d xdg-open'
alias open='d xdg-open'
alias o='open'
alias sql='rlwrap -a -N -c -i sqlite3'
alias neofetch='clear && neofetch'
# alias mars='d java -jar /opt/Mars4_5.jar'
# alias pycharm='d /opt/pycharm-2021.1.2/bin/pycharm.sh'
alias 20min='python3 ~/.local/MyScripts/20min.py'
alias uni='cd ~/Stuff/Career/UNI'
alias unisem='cd ~/"Stuff/Career/UNI/Coursework-and-Course-Material/Year-3/Sem-2/"'
alias 267='unisem && cd CMPUT-267'
alias 301='unisem && cd CMPUT-301'
alias 379='unisem && cd CMPUT-379'
alias 104='unisem && cd PSYCH-104'
alias 225='unisem && cd SOC-225'
alias myrepos='cd ~/Stuff/My-Repos'
alias grep='rg'
alias hx='helix'
alias time='hyperfine --runs 1'
alias sabaki='d ./.local/bin/sabaki-v0.52.2-linux-x64.AppImage'
#----Some more settings----

# case insensitive cd
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

#--- custom functions ---
d() {$* & disown}
compdef d=exec

# open and kill terminal
ok() {
    d xdg-open $1;
    exit;
}
export PATH="$PATH:$HOME/.spicetify"

# The "I forgor :skull:" Section. I forgor..
#	system hierarchy: do `man hier`. Can also read: https://unix.stackexchange.com/questions/8656/usr-bin-vs-usr-local-bin-on-linux
#


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zprof
# eval "$(zoxide init zsh)"

setopt AUTO_PUSHD
setopt pushdminus
