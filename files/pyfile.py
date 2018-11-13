#!/usr/bin/env python3
# -*- coding: utf-8 -*-

__author__ = {
    'kira@-築城院 真鍳',
    'Tanya von Degurechaff'
}

from os import environ, system, chdir #
from sys import argv #----------------#
from shutil import copy #-------------#
from os.path import exists #----------#
from contextlib import suppress #-----#


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
    file = 'modulo.txt'

    with open(file, 'r') as mod:
        parsed = [i.split(':')[0] for i in mod.readlines() if not i.startswith('#')]

    for module in parsed:
        if ver == '-p2':
            system('sudo -H pip install %s' % module)
        elif ver == '-p3':
            system('sudo -H pip3 install %s' % module)


def make_alias(pth, bash):
    a = "_aliases"
    s = "\nif [ -f {0} ]; then\n    . {0}\nfi"
    z, b = "{0}.zshrc;{0}.bashrc".format(pth).split(';')

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


if __name__ == "__main__":

    # shell-script running this script from parent directory
    chdir('files')
    rpath = "{}/".format(environ['HOME'])
    expecting = ('-tc', '-al:b', '-al:z', '-vi', '-vc', '-p2', '-p3')

    for arg in argv[1:]:
        if arg == '-vi':
            check_vim(rpath)
        elif arg == '-tc':
            copy('.tmux.conf', rpath)
        elif arg == '-vc':
            copy('.vimrc', rpath)
            remove_error(rpath)
        elif arg == '-p2' or arg == '-p3':
            pips(arg)
        elif arg.startswith('-al:'):
            make_alias(rpath, arg)
