#!/bin/bash


. init.sh
. ../../functions.sh


if ! installed i3-wm
then
    sudo apt install i3
fi


if ! i3_config
then
    exit $?
fi


if ! grep -q 'scratchpad' $I3_CONF_FILE
then
    cat config/.i3.conf >> $I3_CONF_FILE
fi
