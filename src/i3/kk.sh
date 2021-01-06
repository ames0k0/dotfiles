#!/bin/bash

. ../../functions.sh


if ! installed playerctl
then
    echo 'Not installed'
else
    echo 'Installed'
fi


X11_CONF_DIR=/etc/X11/xorg.conf.d

if [ ! -d $X11_CONF_DIR ];
then
    echo 'Not exists'
else
    echo 'Exists'
fi
