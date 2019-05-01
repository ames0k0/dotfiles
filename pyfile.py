#!/usr/bin/env python3
# -*- coding: utf-8 -*-

__author__ = {
    'kira@-築城院 真鍳',
    'Tanya von Degurechaff'
}


"""
I'm doing (gonna do) API post, here will be only web-scrapers
"""


from os import environ, system, chdir
from sys import argv
from shutil import copy
from os.path import join


def make_alias(bash, path):
    a = "_aliases"
    s = "\nif [ -f {0} ]; then\n    . {0}\nfi"
    z, b = "{0}.zshrc;{0}.bashrc".format(path).split(';')

    def rep(sh):
        return sh.replace('rc', a)

    shells = {
        "b": [b, s.format(rep(b))],
        "z": [z, s.format(rep(z))]
    }

    shell, alias = shells[bash.split(':')[-1][:1]]

    with open(shell, 'a') as fa:
        fa.write(alias)

    copy(a[1:], rep(shell))


def create_vim_folder(arg, path):
    url = "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    if not arg:
        folder = join(path, '.vim', 'autoload')
        system(f"mkdir -p {folder}")
        system(url)

    copy('.vimrc', path)



def vim_levels(level):
    """
    if level == 'm':
    Plug 'junegunn/goyo.vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'
    Plug 'airblade/vim-gitgutter'
    Plug 'edkolev/tmuxline.vim'
    Plug 'Raimondi/delimitMate'
    Plug 'Yggdroot/indentLine'
    Plug 'scrooloose/nerdcommenter'

    Plug 'python-mode/python-mode', { 'branch': 'develop' }
    Plug 'Vimjas/vim-python-pep8-indent'

    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'rafi/awesome-vim-colorschemes'

    Plug 'junegunn/fzf.vim', { 'do': 'yes \| ./install' }
    Plug 'mileszs/ack.vim'

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'mhinz/vim-startify'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'
    Plug 'epeli/slimux'
    Plug 'benmills/vimux'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'

    Plug 'https://github.com/brooth/far.vim'
    """
    pass



if __name__ == "__main__":

    chdir('files')
    rpath = environ['HOME']

    # not tested
    for arg in argv[1:]:
        if arg == '-vi':
            create_vim_folder(False, rpath)
        elif arg == '-vc':
            create_vim_folder(True, rpath)
        elif arg == '-tc':
            copy('.tmux.conf', rpath)
            copy('.tmuxline.conf', rpath)
        elif arg.startswith('-al:'):
            make_alias(arg, rpath)
