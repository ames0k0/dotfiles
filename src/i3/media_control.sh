#!/bin/bash


. ../../functions.sh


if ! installed playerctl
then
    sudo apt install playerctl
fi


if ! grep -q 'playerctl' $I3_CONF_FILE
then
    cat config/.media_control.conf >> $I3_CONF_FILE
fi
