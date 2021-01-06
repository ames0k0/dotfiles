#!/bin/bash


. ../../functions.sh


if ! installed qterminal
then
    sudo apt install qterminal
fi


if ! grep -q 'qterminal' $I3_CONF_FILE
then
    cat config/.floating_terminal.conf >> $I3_CONF_FILE
fi
