#!/bin/bash


export I3_CONF_FILE=$HOME/.config/i3/config


function i3_config () {
    if [ ! -f $I3_CONF_FILE ];
    then
        return 1
    else
        return 0
    fi
}
