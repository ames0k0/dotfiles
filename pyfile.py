#!/usr/bin/env python3
# -*- coding: utf-8 -*-


__author__ = {
    'Nodiru Gaji',
    'LeUser ououZero',
    'Tanya von Degurechaff'
}


def get_zsh_conf():
    zsh_conf = join(rpath, zsh_config)

    if exists(zsh_conf):
        plugins = ('z', 'git', 'tmux', 'vi-mode', 'zsh_reload')

        add_new_line = lambda n: f'{n}\n'
        p_target = 'plugins=('
        t_target = 'ZSH_THEME='

        with open(zsh_conf, 'r') as ftr:
            for line in ftr.readlines():

                if line.startswith(p_target) and (len(line.strip()) != len(p_target)):
                    yield add_new_line(p_target)

                    for each in map(lambda x: add_new_line(f'    {x}'), plugins):
                        yield each

                    yield add_new_line(')')
                    continue

                elif line.startswith(t_target):
                    yield add_new_line(f'{t_target}"afowler"')
                    continue

                yield line


def update_zsh_plugins():

    with open(zsh_config, 'w') as ftw:
        for line in get_zsh_conf():
            ftw.write(line)

    copy(zsh_config, rpath)
    remove(zsh_config)


def create_vim_folder(arg):
    url = "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    if not arg:
        folder = join(rpath, '.vim', 'autoload')
        system(f"mkdir -p {folder}")
        system(url)

    copy('.vimrc', rpath)


if __name__ == "__main__":

    from os import environ, system, chdir, remove
    from sys import argv
    from shutil import copy
    from os.path import join, exists
    from collections import namedtuple

    _args = namedtuple('a', ['vim_init', 'vim_copy', 'tmux_copy', 'zsh_plugins'])
    a = _args('-vi', '-vc', '-tc', '-zp')

    has_args = argv[1:]

    if not has_args:
        print(a)
        exit(0)


    chdir('files')
    rpath = environ['HOME']
    zsh_config = '.zshrc'


    for arg in has_args:
        if arg == a.vim_init:
            create_vim_folder(False)
        elif arg == a.vim_copy:
            create_vim_folder(True)
        elif arg == a.tmux_copy:
            copy('.tmux.conf', rpath)
            copy('.tmuxline.conf', rpath)
        elif arg == a.zsh_plugins:
            update_zsh_plugins()
