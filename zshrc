# Zsh Configuration
setopt autocd 
setopt extendedglob
setopt notify
unsetopt beep
bindkey -e

# -U: do not expand my alias
# -z: use zsh style
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors di=34 fi=0
zstyle :compinstall filename "$HOME/.zshrc"
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt list_packed
setopt always_last_prompt
setopt always_to_end
autoload -Uz colors
colors
autoload -Uz run-help

# Zsh syntax highlight
if [ "$(uname)" = 'Darwin' ] ; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
PROMPT="%{$fg[cyan]%}%n%{$reset_color%}%% "
PROMPT2=">>>"
RPROMPT="%{$bg[magenta]%}[%~]%{$reset_color%}"

if [ -e "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

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
