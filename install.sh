#!/bin/bash

# https://www.youtube.com/watch?v=5r6yzFEXajQ&t=2220s
# https://github.com/gpakosz/.tmux.git
# https://stackoverflow.com/questions/3685970/check-if-a-bash-array-contains-a-value

#
# make logic with python script, i'm checking args in shell-script and python-script
# maybe i need only python script
# never mind, i'm just trying to practice shell-scripting
#

# i only care about args; i will run python script if args in *exist_options*
exist_options=('-tc' '-al:b' '-al:z' '-vi' '-vc' '-p2' '-p3')

if [[ "$#" -gt 0 ]]; then
    for args in "$@"
    do
        if [[ "${exist_options[@]}" =~ "${args}"  ]]; then
            python3 files/pyfile.py "$@"
        fi
    done
else
    echo "Avaliable arguments: ${exist_options[@]}"
fi
