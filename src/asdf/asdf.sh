#!/bin/bash


function node_js {
    asdf plugin add nodejs
    bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

    asdf install nodejs latest
    asdf global nodejs "$(asdf install nodejs latest | cut -d' ' -f2)"
}


function asdf_vm {
    #
    # multiversion support
    # SEE: https://asdf-vm.com/#/core-manage-asdf-vm
    #

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    cd -

    ZSH_CONF=$HOME/.zshrc

    if ! grep -q 'asdf.sh' $ZSH_CONF
    then
        cat .asdf.conf >> $ZSH_CONF
    fi
}


asdf --version


if [ $? -ne 0 ];
then
    asdf_vm
fi


if [ "$1" == "nodejs" ];
then
    node_js
fi
