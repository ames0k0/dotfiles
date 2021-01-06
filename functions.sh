#!/bin/bash


function installed () {
    dpkg -s $1 &> /dev/null
}


function requirement_tools {
    sudo apt-get install --reinstall \
        git gpg curl \
        silversearcher-ag ack fzf universal-ctags \
        ipython3
}


function other_tools {
    sudo apt-get install --reinstall \
        wget ssh keychain ranger htop tldr net-tools ncdu

    ZSH_CONF=$HOME/.zshrc

    if ! grep -q 'keychain' $ZSH_CONF
    then
        echo '. $HOME/.keychain/`uname -n`-sh 2>/dev/null' >> $ZSH_CONF
    fi
}
