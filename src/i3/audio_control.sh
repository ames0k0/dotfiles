#!/bin/bash


# https://www.youtube.com/watch?v=8-S0cWnLBKg
#     Media and volume keys snippet
#     https://faq.i3wm.org/question/3747/enabling-multimedia-keys/?answer=3759#post-id-3759
#


. ../../functions.sh


if ! installed pulseaudio-utils
then
    sudo apt install pulseaudio-utils
fi


if ! grep -q 'pactl' $I3_CONF_FILE
then
    cat config/.audio_control.conf >> $I3_CONF_FILE
fi
