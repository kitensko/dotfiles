# Zsh Configuration
setopt autocd 
setopt extendedglob
setopt notify
unsetopt beep
bindkey -e

# Zsh Completion
fpath=(/usr/local/share/zsh-completions $fpath)

# -U: do not expand my alias
# -z: use zsh style
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors di=34 fi=0
zstyle :compinstall filename '/Users/kitten/.zshrc'
setopt auto_list
setopt auto_menu
setopt always_last_prompt
setopt always_to_end
autoload -Uz colors
colors
autoload -Uz run-help

# Zsh syntax highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
PROMPT="%{$fg[cyan]%}%n%{$reset_color%}%% "
PROMPT2=">>>"
RPROMPT="%{$bg[magenta]%}[%~]%{$reset_color%}"
