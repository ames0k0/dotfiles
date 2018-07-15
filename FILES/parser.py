#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# __author__ = 'kira@-築城院 真鍳'

def parser(ver):
    with open(ver, 'r') as mod:
        return [i.split(':')[0] for i in mod.readlines() if not i.startswith('#')]
