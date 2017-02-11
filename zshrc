bindkey -e
setopt correct
setopt extendedglob
setopt notify
setopt auto_list
setopt auto_menu
setopt always_last_prompt
setopt always_to_end
setopt auto_pushd
unsetopt beep

# for macOS
if [ $(uname) = "Darwin" ]; then 
  export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
  export LSCOLORS=gxfxcxdxbxegedabagacad
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:\
                    cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
else
  man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
  }
fi

# -U: do not expand my alias
# -z: use zsh style
autoload -Uz compinit
compinit -u
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors di=34 fi=0
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz colors
colors
zstyle ':completion:*' list-colors \
'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':compinstall' filename "$HOME/.zshrc"
autoload -Uz colors; colors
autoload -Uz run-help

# history
setopt hist_ignore_dups
setopt hist_ignore_space

# Prompt
PROMPT="%{$fg[cyan]%}%m%{$reset_color%}%% "
PROMPT2="%{$fg[cyan]%}>>>%{$reset_color%} "
RPROMPT="%{$bg[magenta]%}[%~]%{$reset_color%}"

# pyenv
if [ -e "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# zplug
if [ $(uname) = "Darwin" ]; then 
  export ZPLUG_HOME=/usr/local/opt/zplug
  source $ZPLUG_HOME/init.zsh
else
  export ZPLUG_HOME=/usr/share/zsh/scripts/zplug
  source $ZPLUG_HOME/init.zsh
fi

zplug 'hchbaw/auto-fu.zsh'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'

if ! zplug check; then
    zplug install
fi

fpath=($ZPLUG_HOME/repos/zsh-users/zsh-completions/src $fpath)

# for auto-fu.zsh
source $ZPLUG_HOME/repos/hchbaw/auto-fu.zsh/auto-fu.zsh
zle-line-init () {auto-fu-init;}; zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select
zstyle ':completion:*' completer _oldlist _complete
zstyle ':auto-fu:var' postdisplay $''

#source $ZPLUG_HOME/repos/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
# for zsh-syntax-highlighting
source $ZPLUG_HOME/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
