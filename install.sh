#!/bin/bash


function install_from_package_list() {
    for i in "$@"
    do
        sudo apt install "$i"
    done
}


function _vim {
    if [ ! -d "$HOME/.vim/autoload" ]; then
        curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
            'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

    cp 'src/dots/.vimrc' $HOME
}


function _tmux {
    new_theme="$HOME/.tmux-themepack"

    if [ ! -d "$new_theme" ]; then
        git clone 'https://github.com/jimeh/tmux-themepack.git' $new_theme
    fi

    cp 'src/dots/.tmux.conf' $HOME
}


function _asdf_vm {
    #
    # multiversion support
    # SEE: https://asdf-vm.com/#/core-manage-asdf-vm
    #

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    cd -

    config_path="$HOME/.bashrc"

    if [[ -f "$HOME/.zshrc" ]]; then
        config_path="$HOME/.zshrc"
    fi

    echo '. $HOME/.asdf/asdf.sh' >> $config_path
    echo '. $HOME/.asdf/completions/asdf.bash' >> $config_path

    asdf plugin add nodejs
    asdf install nodejs latest

    install_from_package_list gpg
    bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
    asdf global nodejs "$(asdf install nodejs latest | cut -d' ' -f2)"

}


function _install_plugins {
    vim -c ':PlugInstall' -c 'qall'
    vim -c ':CocInstall coc-json coc-tsserver coc-python coc-html coc-css' -c 'qall'
}


function _command_check {
    if ! command -v $1 &> /dev/null
    then
        return 0
    fi

    return 1
}


function coc_python {
    # SEE:
    # https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script

    pp='pip3'

    if [[ $(_command_check $pp) -eq 0 ]]; then
        pp='pip'

        if [[ $(_command_check $pp) -eq 0 ]]; then
            echo '[!] Required pip for python!'
            exit 1
        fi

    fi

    $pp install jedi pylint python-language-server

}


OS_TOOLS=(tmux ranger ssh keychain tldr)
CONFIG_TOOLS=(vim curl wget git zsh silversearcher-ag ack fzf ctags)
# TODO
# I3_CONFIG=(xbacklight)


if [ "$1" == "--i-tools" ]; then
    install_from_package_list "${OS_TOOLS[@]}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sed -i 's/plugins=(git)/plugins=(z git tmux asdf vi-mode zsh_reload)/g' $HOME/.zshrc
    set -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="afowler"/g' $HOME/.zshrc

else
    echo '[!] Install nodejs + npm for coc-nvim. !required'
    echo '[-] --i-tools installing not required programms too.'
    echo '[-] You need to modify it!'
    exit 1
fi


install_from_package_list "${CONFIG_TOOLS[@]}"

_vim
_tmux


if [[ $(_command_check 'nodejs') -eq 0 ]]; then
    echo '[!] Installing asdf-vm for nodejs and npm!'
    _asdf_vm
fi

coc_python
