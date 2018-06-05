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
fi

if [ "$1" == "copy" ];
then
	echo "#### copy $2 ####"
	copy_file $2
fi

# setup i3 configuration
mv ~/.config/i3 ~/.config/i3_backup
ln -sf $PWD/i3 ~/.config/i3 

sudo pacman -S feh arandr ttf-font-awesome lxappearance thunar rofi compton i3blocks


# https://github.com/supermarin/YosemiteSanFranciscoFont
# move ttf fonts to ~/.fonts
