#!/bin/bash


. ../../functions.sh


if ! installed tmux
then
    sudo apt install tmux
fi


if ! installed git
then
    sudo apt install git
fi


new_theme="$HOME/.tmux-themepack"


if [ ! -d "$new_theme" ]; then
    git clone 'https://github.com/jimeh/tmux-themepack.git' $new_theme
fi


cp '.tmux.conf' $HOME
