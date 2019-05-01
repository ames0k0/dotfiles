#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# __author__ = 'kira@-天底 ガジ'

from os import environ
from collections import (
    namedtuple, defaultdict, deque
)


Symbols = namedtuple('Symbols', ['at', 'fb', 'bb', 'td', 'st'])
s = Symbols('@', '{', '}', ':', '*')


user = environ['USER']


def get_link(url):
    url = f'http://localhost/{user}'
    # pass


cache = defaultdict(list)


class ShiPasa:
    """
    @   - start_insName
    { } - for body
    ::  - delimiter, pipe like
    n*  - execute insName
    """

    def __init__(self):
        self.ddl = defaultdict(list)

    def get_inst(self, ins_name='main'):
        def get_body(chunk):
            self.ddl[ins_name].append(chunk)
        return get_body

    def get_container(self, file):
        for each in file.readlines():
            each = each.strip()

            if not each or each.startswith(s.fb):
                continue

            ins_name = self.get_inst()

            if each.startswith(s.at):
                ins_name = self.get_inst(each)
            elif each.startswith(s.bb):
                ins_name = None
            else:
                ins_name(each)


    def __call__(self, file):
        self.get_container(file)
        print('<<<<<<', self.ddl)



if __name__ == "__main__":
    shipasa = ShiPasa()

    # with open('test.txt', 'r') as file:
    with open('start_config.cfg', 'r') as file:
        shipasa(file)
