#!/bin/bash


. ../../functions.sh


function change_plugins_and_theme {
    #
    # changing zsh config
    #
    sed -i 's/^plugins=(git)/plugins=(z fzf git tmux asdf vi-mode zsh_reload)/g' $ZSH_CONF
    sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="afowler"/g' $ZSH_CONF
}


if ! installed zsh
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # skipped after installing zsh
    change_plugins_and_theme
fi
