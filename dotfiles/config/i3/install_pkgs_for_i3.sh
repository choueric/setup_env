#!/bin/sh

DISTR=`lsb_release  -a 2> /dev/null | grep Distributor | cut -f 2`
SFDFontURL="https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip"
SFDZip=SanFrancisoFont.zip

# for Ubuntu

if [ "$DISTR" = "Ubuntu" ]; then
    echo "Install for Ubuntu ..."
    wget $SFDFontURL -O $SFDZip
    unzip $SFDZip
    mkdir -p ~/.fonts
    cp -v ./YosemiteSanFranciscoFont-master/*.ttf ~/.fonts
    sudo apt install feh arandr rofi fonts-font-awesome compton i3blocks
else
    echo "Not support $DISTR"
    exit 1
fi
