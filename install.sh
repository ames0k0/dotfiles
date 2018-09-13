#!/bin/bash

# https://www.youtube.com/watch?v=5r6yzFEXajQ&t=2220s
# https://github.com/gpakosz/.tmux.git

for i in $@
do
    if [ $i == '-tc' ]; then
        cp -f FILES/.tmux.conf ~/
    elif [ $i == '-vi' ]; then
        python3 FILES/pyfile.py $i
    elif [ $i == '-vc' ]; then
        cp -f FILES/.vimrc ~/
        python3 FILES/pyfile.py $i
    elif [ $i == '-p2' ]; then
        python3 FILES/pyfile.py $i
    elif [ $i == '-p3' ]; then
        python3 FILES/pyfile.py $i
    fi
done
