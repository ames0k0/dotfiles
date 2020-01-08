#!/bin/bash


function _vim {
    if [ ! -d "$HOME/.vim/autoload" ]; then
        curl -fLo $HOME.vim/autoload/plug.vim --create-dirs \
            'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

    cp 'files/.vimrc' $HOME

}


function _tmux {
    new_theme="$HOME/.tmux-themepack"

    if [ ! -d "$new_theme" ]; then
        git clone 'https://github.com/jimeh/tmux-themepack.git' $new_theme
    fi

    cp 'files/.tmux.conf' $HOME

    prev_theme="$HOME/.tmuxline.conf"

    if [ -f "$prev_theme" ]; then
        rm $prev_theme
    fi
}


# SEE: https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
if [ "$#" -gt 0 ]; then
    for arg in "$@"; do
        case $arg in
            -vi)
                _vim
                ;;
            -ti)
                _tmux
                ;;
        esac
    done
fi
