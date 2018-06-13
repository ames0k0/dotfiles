#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# __author__ = 'Tanya von Degurechaff'

from os import getcwd, system #
from os.path import exists #--#


realp = getcwd()
vpath = '.vim/ftplugin/'
vpp = realp.split('/')
vim = 'wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x'


def func(pth):
    """
    nah install vim if exists
    """
    if exists(pth):
        # python2
        kk = raw_input('Vim exists!, reinstall vim ?: ')
        if kk.lower() == 'y':
            system(vim)
            system('reset')
    else:
        system(vim)
        system('reset')


kali = '/root'
ubuntu = '/home'

if realp.startswith(ubuntu):
    func('/{}/{}/{}'.format(vpp[1], vpp[2], vpath))
elif realp.startswith(kali):
    func('/{}/{}'.format(vpp[1], vpath))
