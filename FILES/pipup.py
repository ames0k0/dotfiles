#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# __author__ = 'Tanya von Degurechaff'

from os import system #---#
from sys import argv #----#


def parser(ver):
    with open(ver, 'r') as mod:
        return [i.split(':')[0] for i in mod.readlines() if not i.startswith('#')]


def pips(ver):
    parsed = parser('FILES/modulo.txt')
    for module in parsed:
        if ver == '-2':
            system('sudo -H pip install %s' % module)
        else:
            system('sudo -H pip3 install %s' % module)

pips(arg[1])
