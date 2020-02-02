#!/bin/bash

sudo apt update

# for config
sudo apt install vim ack fzf ctags

# for system
sudo apt install git zsh ssh tldr curl wget tmux ranger \
    keychain xbacklight silversearcher-ag


# zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
