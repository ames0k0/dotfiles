![kali linux report:2020-09-04/02-20-47](https://user-images.githubusercontent.com/26835631/92335453-bd9ef900-f09f-11ea-8605-388c35fe39e8.png)
### TODO
[-] test with new user
[-] add font info


### info
```
[[ os ]]
[$] cat /etc/issue
[o] Kali GNU/Linux Rolling


[[ start ]]
[$] sudo apt-get update


[[ requirements ]]
[$] ./install.sh -req
[$] apt install --reinstall {
    os   : vim curl tmux zsh i3
    asdf : gpg
    vim  : silversearcher-ag ack fzf universal-ctags
    i3   : feh xbacklight compton
    py   : python3-pip
}


[[ dev ]]
[$] ./install.sh -dev
[$] apt install --reinstall {
    os+  : wget ssh keychain ranger htop tldr net-tools ncdu
}
```


### zsh :(z shell)
```
[$] ./install.sh -zsh
[+] added plugins : z git tmux asdf vi-mode zsh_reload
[+] changed theme : afowler
```


### tmux :(terminal multiplexer)
```
[$] ./install.sh -zsh
[+] installed theme and copied the config file
```


### vim :(Vi Improved)
```
[$] ./install.sh -vim
[+] installed plug.vim and copied the config file
[+] installed python-language-server

[v] PlugInstall
[v] CocInstall coc-json coc-sh coc-tsserver coc-python coc-html coc-css
```


### asdf :(multiple runtime versions)
```
[$] ./install.sh -asdf
[+] installed gpg nodejs latest and python latest
```


### i3, i3-gaps :(tiling window manager)
```
[$] ./install.sh -i3
[+] copied background image, configs for floating terminal and i3-gaps
```
