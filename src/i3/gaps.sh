#!/bin/bash


. ../../functions.sh


if ! installed i3-gaps
then
    sudo apt install i3-gaps
fi


if ! grep -q 'gaps' $I3_CONF_FILE
then
    sed -i 's/^bar {/bar {\n    height 15/g' $I3_CONF_FILE
    cat config/.gaps.conf >> $I3_CONF_FILE
fi
