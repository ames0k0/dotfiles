#!/bin/bash

# https://www.youtube.com/watch?v=5r6yzFEXajQ&t=2220s

for i in $@
do
    if [ $i == '-ti' ]; then
        # https://github.com/gpakosz/.tmux.git
        cp -f FILES/.tmux.conf ~/
    elif [ $i == '-vi' ]; then
        python3 FILES/check_vim.py
    elif [ $i == '-vc' ]; then
        cp -f FILES/.vimrc ~/
        cp -f FILES/pyflakes.vim ~/.vim/ftplugin/python/
    elif [ $i == '-pip' ]; then
        python FILES/pipup.py '-2'
    elif [ $i == '-pip3' ]; then
        python3 FILES/pipup.py '-3'
    fi
done
