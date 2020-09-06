#!/bin/bash

#
# ./install.sh [-all] | -{arg}
#


ZSH_CONF="$HOME/.zshrc"
I3_CONF="$HOME/.config/i3/config"


sudo apt-get update


function _req {
    sudo apt-get install --reinstall \
        vim curl tmux zsh \
        gpg \
        silversearcher-ag ack fzf universal-ctags \
        feh xbacklight compton \
        python3-pip
}

[ "$1" == "-req" ] && _req


function _dev {
    #
    # *git used to clone this
    #
    sudo apt-get install --reinstall \
        zsh git wget ssh keychain ranger htop tldr net-tools ncdu

    echo '. $HOME/.keychain/`uname -n`-sh 2>/dev/null' >> $ZSH_CONF

}

[ "$1" == "-dev" ] && _dev


function _get_plugins_and_themes {
    #
    # changing zsh config
    #
    sed -i 's/^plugins=(git)/plugins=(z fzf git tmux asdf vi-mode zsh_reload)/g' $ZSH_CONF
    sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="afowler"/g' $ZSH_CONF
}


function _zsh {
    #
    # oh-my-zsh
    #
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # skipped after installing zsh
    _get_plugins_and_themes
}

[ "$1" == "-zsh" ] && _zsh


function _tmux {
    #
    # tmux theme + config
    #
    new_theme="$HOME/.tmux-themepack"

    if [ ! -d "$new_theme" ]; then
        git clone 'https://github.com/jimeh/tmux-themepack.git' $new_theme
    fi

    cp 'src/dots/.tmux.conf' $HOME
}

[ "$1" == "-tmux" ] && _tmux


function _vim {
    if [ ! -d "$HOME/.vim/autoload" ]; then
        curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
            'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

    cp 'src/dots/.vimrc' $HOME

    pip3 install python-language-server flake8
}

[ "$1" == "-vim" ] && _vim


function _asdf {
    #
    # multiversion support
    # SEE: https://asdf-vm.com/#/core-manage-asdf-vm
    #

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    cd -

    echo '. $HOME/.asdf/asdf.sh' >> $ZSH_CONF
    echo '. $HOME/.asdf/completions/asdf.bash' >> $ZSH_CONF

    asdf plugin add nodejs
    bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

    asdf install nodejs latest
    asdf global nodejs "$(asdf install nodejs latest | cut -d' ' -f2)"
}

[ "$1" == "-asdf" ] && _asdf


function _i3 {
    # touchpad click
    # SEE: https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/
    sudo mkdir -p /etc/X11/xorg.conf.d && cp src/dots/.touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf

    # terminal transparent :req: compton
    cp src/dots/.compton.conf $HOME/.config/

    # background image :req: feh
    cp src/pics/anime_girl.jpg $HOME/Pictures/wallpaper.jpg

    # backlight :req: xbacklight

    # i3-gaps
    sed -i 's/^bar {/bar {\n    height 15/g' $I3_CONF
    cat src/dots/.i3.conf >> $I3_CONF
}

[ "$1" == "-i3" ] && _i3


if [ "$1" == "-all" ]; then
    _req
    _dev
    _zsh
    _tmux
    _vim
    _asdf
    _i3
fi
