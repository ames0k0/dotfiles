#!/bin/bash


# touchpad click
# SEE: https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/

X11_CONF_DIR=/etc/X11/xorg.conf.d


if [ ! -d $X11_CONF_DIR ];
then
    sudo mkdir -p $X11_CONF_DIR
fi


TOUCHPAD_CONF_FILE=$X11_CONF_DIR/90-touchpad.conf


if [ ! -f $TOUCHPAD_CONF_FILE ];
then
    cp config/.90-touchpad.conf $TOUCHPAD_CONF_FILE
fi
