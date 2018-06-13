#!/bin/bash

# https://www.youtube.com/watch?v=5r6yzFEXajQ&t=2220s

for i in $@
do
    if [ $i == '-ti' ]; then
        # https://github.com/gpakosz/.tmux.git
        cp -f .tmux/.tmux.conf ~/
        cp -f .tmux/.tmux.conf.local ~/
    elif [ $i == '-vi' ]; then
        python check_vim.py
    elif [ $i == '-vc' ]; then
        cp -f .vimrc ~/
        cp -f pyflakes.vim ~/.vim/ftplugin/python/
    elif [ $i == '-pip' ]; then
        python pipup.py '-2'
    elif [ $i == '-pip3' ]; then
        python3 pipup.py '-3'
    fi
done
