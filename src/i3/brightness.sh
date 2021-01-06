#!/bin/bash


. ../../functions.sh


installed xbacklight


if ! installed xbacklight
then
    sudo apt install xbacklight
fi


if ! grep -q 'xbacklight' $I3_CONF_FILE
then
    cat config/.brightness.conf >> $I3_CONF_FILE
fi
