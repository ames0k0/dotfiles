```
alias ma='Ubuntu 18.04'
alias ins='sudo apt-get install'
alias pin='pip3 install --user'


requirements:

    - oh-my-zsh:
        - url: https://github.com/robbyrussell/oh-my-zsh
        - terminal-command:
            $ ins zsh
            $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        - plugins: z, git, tmux, vi-mode

    - fzf:
        - url: https://github.com/junegunn/fzf.git
        - terminal-command:
            $ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            $ ~/.fzf/install

    - curl:
        - url: https://github.com/curl/curl
        - terminal-command:
            $ ins curl

    - ctags:
        - url: https://github.com/universal-ctags/ctags
        - terminal-command:
            $ ins ctags

    - ag (the-silver-searcher):
        - url: https://github.com/ggreer/the_silver_searcher
        - terminal-command:
            $ ins silversearcher-ag


tools (apps):

    - git:
        - url: https://github.com/git/git
        - terminal-command:
            $ ins git

    - i3 (window manager):
        - url: https://github.com/i3/i3
        - terminal-command:
            $ ins i3

    - ranger (filemanager):
        - url: https://github.com/ranger/ranger
        - terminal-command:
            $ ins ranger

    - pywal (color-schemes):
        - url: https://github.com/dylanaraps/pywal
        - terminal-commnd:
            $ pin pywal colorz
            $ wal -i path/to/the/image

    - tldr (too long don't read; man page):
        - url: https://github.com/tldr-pages/tldr
        - terminal-command:
            $ ins tldr

    - python3 and pip:
        - url: https://www.python.org/
        - terminal-command:
            $ ins python3 python3-pip

    - thefuck:
        - url: https://github.com/nvbn/thefuck
        - terminal-command:
            $ ins thefuck
            $ pin thefuck


notes:
    - vim_slow_start:
        - plugins: pymode, jedi, pep8-indent
        - terminal-command:
            $ vim --startuptime output.txt pyfile.py

    - terminal_settings:
        - font: MonospaceRegular 10
        - built-in_schemes: Tango dark
        - palette_built-in_schemes: Solarized

        - no:
            - transparent_background, bold-text, menubar, terminal_bell


youtube_for_help:
    - vim:
        - https://www.youtube.com/user/tianma201211/playlists

    - linux:
        - https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA/playlists


vim default Leader -> '\'
let mapleader=','

./pyfile.py [ args ]
    -vi     -> *install vim plug manager, then -vc
    -vc     -> *make vim config
    -tc     -> *make tmux config
```
![vim_tmux_workflow](https://user-images.githubusercontent.com/26835631/38773287-09b7bd24-4051-11e8-8940-e30aac9c75fd.png)
![new_vim_pic](https://user-images.githubusercontent.com/26835631/45950430-a0c6a380-bff7-11e8-8c9a-6dfff153640e.png)
# More Pics (Kali-linux, Ubuntu, Windows)
![kali-linux](https://raw.githubusercontent.com/hhiki/dotfiles/master/pics/kali-linux.png)
![Ubuntu](https://raw.githubusercontent.com/hhiki/dotfiles/master/pics/Ubuntu.png)
![Windows](https://raw.githubusercontent.com/hhiki/dotfiles/master/pics/windows.png)
