#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# __author__ = 'kira@-築城院 真鍳'
# __author__ = 'Tanya von Degurechaff'

from os import getcwd, system #-----#
from sys import argv #--------------#
from os.path import exists, dirname #


def check_vim(pth):
    vim = 'wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x'
    pth += '.vim/ftplugin/'

    if exists(pth):
        kk = input('Vim exists!, reinstall vim? [y/n]: ')
        if kk.lower() == 'y':
            system(vim)
            system('reset')
    else:
        system(vim)
        system('reset')


def remove_error(pth):
    # JUST ADD -> " (comment 28th line)
    pth += '.vim/ftplugin/python/pyflakes.vim'
    repl = '        " {}\n'
    if exists(pth):
        with open(pth, 'r') as f:
            err = f.readlines()

        err[27] = repl.format(" ".join(err[27].split()))

        with open(pth, 'w') as f:
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
    # rpath -> /home/user/
    # system('cd ~'), exists('~') <- NOT WORKING
    rpath = "{}/".format(dirname(dirname(getcwd())))
    if argv[1] == '-vi':
        check_vim(rpath)
    elif argv[1] == '-p2':
        pips('-2')
    elif argv[1] == '-p3':
        pips('-3')
    elif argv[1] == '-vc':
        remove_error(rpath)
