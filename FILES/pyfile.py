#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# __author__ = 'kira@-築城院 真鍳'
# __author__ = 'Tanya von Degurechaff'

from os import getcwd, system #
from sys import argv #--------#
from os.path import exists #--#


def check_vim(pth):
    vim = 'wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x'

    if exists(pth):
        kk = input('Vim exists!, reinstall vim? [y/n]: ')
        if kk.lower() == 'y':
            system(vim)
            system('reset')
    else:
        system(vim)
        system('reset')


def remove_error():
    # JUST ADD -> "
    FILE = '~/.vim/ftplugin/python/pyflakes.vim'
    repl = '        " {}\n'
    if exists(FILE):
        with open(FILE, 'r') as f:
            err = f.readlines()

        err[27] = repl.format(" ".join(err[27].split()))

        with open(FILE, 'w') as f:
            f.write("".join(err))
    else:
        print('file is not exists')


def pips(ver):
    FILE = 'FILES/modulo.txt'

    with open(FILE, 'r') as mod:
        parsed = [i.split(':')[0] for i in mod.readlines() if not i.startswith('#')]

    for module in parsed:
        if ver == '-2':
            system('sudo -H pip install %s' % module)
        elif ver == '-3':
            system('sudo -H pip3 install %s' % module)


if __name__ == "__main__":
    if argv[1] == '-vi':
        # ~/.vim/ftplugin/ <- NOT WORKING
        kali = '/root/'
        ubuntu = '/home'
        realp = getcwd()
        vpath = '.vim/ftplugin/'
        vpp = realp.split('/')
        if realp.startswith(ubuntu):
            check_vim('/{}/{}/{}'.format(vpp[1], vpp[2], vpath))
        elif realp.startswith(kali):
            check_vim('/{}/{}'.format(vpp[1], vpath))
    elif argv[1] == '-p2':
        pips('-2')
    elif argv[1] == '-p3':
        pips('-3')
    elif argv[1] == '-vc':
        remove_error()
