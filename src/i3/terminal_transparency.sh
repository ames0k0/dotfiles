#!/bin/bash


. ../../functions.sh


if ! installed compton
then
    sudo apt-get install compton
fi


CONF_FILE='.compton.conf'


if [ -f $HOME/.config/$CONF_FILE ];
then
    cp config/$CONF_FILE $HOME/.config/
fi


if ! grep -q 'compton' $I3_CONF_FILE
then
    echo 'exec --no-startup-id compton' >> $I3_CONF_FILE
fi
