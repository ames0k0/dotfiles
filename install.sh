#!/bin/bash


#
# Just wasting time to tryna find an errors
#


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


function _coc_python {
    pip3 install jedi pylint python-language-server
}


OS_TOOLS=(tmux ranger ssh keychain tldr)
CONFIG_TOOLS=(vim curl wget git zsh silversearcher-ag ack fzf ctags)
# TODO
# I3_CONFIG=(xbacklight)


install_from_package_list "${OS_TOOLS[@]}"
install_from_package_list "${CONFIG_TOOLS[@]}"


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/plugins=(git)/plugins=(z git tmux asdf vi-mode zsh_reload)/g' $HOME/.zshrc
set -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="afowler"/g' $HOME/.zshrc


_vim
_tmux


if [ "$1" == "--i-asdf" ]; then
    _asdf_vm
fi


_coc_python
_install_plugins
