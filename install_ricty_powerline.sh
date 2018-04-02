#!/bin/bash

git clone https://github.com/powerline/fontpatcher.git
python3 ./fontpatcher/scripts/powerline-fontpatcher\
    --source-font ./fontpatcher/fonts/powerline-symbols.sfd\
    $(find / -name 'Ricty-Regular.ttf' 2>/dev/null | head -n1)
python3 ./fontpatcher/scripts/powerline-fontpatcher\
    --source-font ./fontpatcher/fonts/powerline-symbols.sfd\
    $(find / -name 'Ricty-Bold.ttf' 2>/dev/null | head -n1)

rm -rf fontpatcher
mkdir -p $HOME/.fonts
mv Ricty* .fonts/

fc-cache -vf
