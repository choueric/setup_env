#!/bin/sh

DISTR=`lsb_release  -a 2> /dev/null | grep Distributor | cut -f 2`

# for Ubuntu

if [ "$DISTR" = "Ubuntu" ]; then
    echo "Install for Ubuntu ..."
    sudo apt install feh arandr rofi fonts-font-awesome compton i3blocks
else
    echo "Not support $DISTR"
    exit 1
fi
