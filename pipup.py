#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# __author__ = 'Tanya von Degurechaff'

from os import system #
from sys import argv ##


def pipins(ver):
    """
    [ pip$ -r ] need version of modules (bs4==1.12.0)
        It's not requirements.txt
    """
    with open('modulo.txt', 'r') as mod:
        for i in mod.readlines():
            if not i.startswith('#'):
                modwc = i.split(':')[0]
                if ver == '-2':
                    system('sudo -H pip install %s' % modwc)
                else:
                    system('sudo -H pip3 install %s' % modwc)

pipins(argv[1])
