#!/bin/bash

. ../../functions.sh


if ! installed vim
then
    sudo apt install vim
fi


if ! installed curl
then
    sudo apt install curl
fi


if [ ! -d "$HOME/.vim/autoload" ]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi


cp '.vimrc' $HOME
