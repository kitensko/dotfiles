#alias
alias la="ls -all"
alias ll="ls -l"
alias vi="vim"
alias vim="/usr/local/Cellar/vim/7.4.922/bin/vim"
alias -s py="python3"

#Environment variable 
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=$(which vim)
export VISUAL=$(which vim)
export PAGER=$(which less)
# Zsh Environment
export HISTFILE=~/.histfile
export HISTSIZE=100000
export SAVEHIST=10000