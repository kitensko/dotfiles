#!/bin/bash

# lilyterm
ln -s $HOME/dotfiles/default.conf $HOME/.config/lilyterm/
# zshrc
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc 
ln -s $HOME/dotfiles/zshenv $HOME/.zshenv
# IPython
mkdir -p $HOME/.ipython/profile_default/startup/
ln -s $HOME/dotfiles/startup.py $HOME/.ipython/profile_default/startup/
