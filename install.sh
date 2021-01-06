#!/bin/bash


. functions.sh
. src/i3/init.sh


sudo apt-get update


requirement_tools


cd src


cd i3
./i3.sh


if ! i3_config
then
    echo "[!] $I3_CONF_FILE :: dosn't exists"
    exit 1
fi

./gaps.sh
./touchpad.sh
./wallpaper.sh
./brightness.sh
./floating_terminal.sh
./terminal_transparency.sh
./audio_control.sh
# ./media_control.sh
cd -


cd tmux
./tmux.sh
cd -


cd vim
./vim.sh
cd -


cd ohmyzsh
./zsh.sh
cd -


# cd asdf
# ./asdf.sh
# cd -


other_tools
