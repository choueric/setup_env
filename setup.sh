#!/bin/bash

set -x
set -e

function copy_file {
	echo "#### install [$1] ####"
	if [ -e ~/.$1 ]; then
		mv -f ~/.$1 ~/.$1.bak
	fi
	ln -s `pwd`/$1 ~/.$1
}

if [ "$1" == "" ];
then
	echo "#### all ####"
	copy_file vimrc
	copy_file bashrc
	copy_file git-completion.bash
	copy_file tmux.conf
	copy_file gitconfig
	copy_file ctags
	#copy_file xmodmaprc
fi

if [ "$1" == "copy" ];
then
	echo "#### copy $2 ####"
	copy_file $2
fi

# for i3 in archlinux
#FONT_DIR=~/.local/share/fonts
#
#copy_file config/i3
#
#sudo pacman -S i3 feh arandr ttf-font-awesome lxappearance thunar rofi compton \
#	i3blocks dialog wpa_supplicant iw ctags
#
#git clone https://github.com/supermarin/YosemiteSanFranciscoFont
#mkdir -p $FONT_DIR
#mkdir -p workspace/builds
#mv YosemiteSanFranciscoFont/*.ttf $FONT_DIR
#
#sudo cp shadowsocks.service /etc/systemd/system/shadowsocks.service
#sudo systemctl enable shadowsocks.service
#sudo systemctl enable wpa_supplicant@wlp58s0
