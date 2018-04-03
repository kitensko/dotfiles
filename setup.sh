#!/bin/bash

dotfile_dir=$HOME/dotfiles
dein_dir=$HOME/.vim/bundles
zplug_dir=$HOME/.zplug

# zshrc
ln -s $dotfile_dir/zshrc $HOME/.zshrc 
ln -s $dotfile_dir/zshenv $HOME/.zshenv
git clone https://github.com/zplug/zplug.git $zplug_dir
# VIM
ln -s $dotfile_dir/vimrc $HOME/.vimrc
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $dein_dir
rm -f ./installer.sh
ln -s $dotfile_dir/dein.toml $HOME/.vim/.dein.toml
ln -s $dotfile_dir/dein_lazy.toml $HOME/.vim/.dein_lazy.toml
ln -s $dotfile_dir/colorscheme.toml $HOME/.vim/.colorscheme.toml
# lilyterm
ln -s $dotfile_dir/default.conf $HOME/.config/lilyterm/
# IPython
mkdir -p $HOME/.ipython/profile_default/startup/
ln -s $dotfile_dir/startup.py $HOME/.ipython/profile_default/startup/
