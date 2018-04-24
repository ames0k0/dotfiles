#!/bin/bash

# https://www.youtube.com/watch?v=5r6yzFEXajQ&t=2220s

for i in $@
do
    if [ $i == '-ti' ]; then
        git clone https://github.com/gpakosz/.tmux.git
        ln -s -f .tmux/.tmux.conf
        cp .tmux/.tmux.conf.local .
    elif [ $i == '-tc' ]; then
        cp -f .tmux.conf ~/
        cp -f .tmux.conf.local ~/
    elif [ $i == '-vi' ]; then
        wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x
    elif [ $i == '-vc' ]; then
        cp -f .vimrc ~/
    elif [ $i == '-pi' ]; then
        sudo -H pip3 install pygame Cython keras scikit-learn tensorflow matplotlib numpy pandas \
                             seaborn Tkinter virtualenv flask flask-admin flask-sqlalchemy django \
                             requests bs4 img2pdf pdir2 selenium pydub nltk gensim
    fi
done
## bashrc --
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][kira@-築城院 真鍳]\[\033[34m\]:\[\033[01;95m\]\W\[\033[00m\]\n\$ '

## etc/envirement --
# WORK="path to workspace"

## export / unset --
# export WORK="path to workspace"
# cd $WORK
# unset WORK
