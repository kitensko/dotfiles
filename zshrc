# Zsh Configuration
setopt autocd 
setopt extendedglob
setopt notify
unsetopt beep
bindkey -e

export PATH=$PATH:$HOME/Library/Python/3.5/bin
# Zsh Completion
fpath=(/usr/local/share/zsh-completions $fpath)

# -U: do not expand my alias
# -z: use zsh style
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors di=34 fi=0
zstyle :compinstall filename "$HOME/.zshrc"
setopt auto_list
setopt auto_menu
setopt always_last_prompt
setopt always_to_end
autoload -Uz colors
colors
autoload -Uz run-help

# Zsh syntax highlight
if [ "$(uname)" = 'Darwin' ] ; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Prompt
PROMPT="%{$fg[cyan]%}%n%{$reset_color%}%% "
PROMPT2=">>>"
RPROMPT="%{$bg[magenta]%}[%~]%{$reset_color%}"

# powerline
powerline-daemon -q
if [ "$(uname)" = "Darwin" ] ; then
    source /$HOME/Library/Python/3.5/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
fi

if [ -e "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
