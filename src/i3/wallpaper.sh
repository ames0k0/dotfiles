#!/bin/bash


. ../../functions.sh


if ! installed feh
then
    sudo apt install feh
fi


if ! grep -q 'wallpaper' $I3_CONF_FILE
then
    echo 'exec --no-startup-id feh --no-fehbg --bg-fill $HOME/dotfiles/src/i3/static/wallpaper.jpg' >> $I3_CONF_FILE
fi
