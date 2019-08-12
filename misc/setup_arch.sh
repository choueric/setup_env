#!/bin/bash

# for i3 in archlinux
FONT_DIR=~/.local/share/fonts

pacman -S sudo tmux openssh
visudo
sudo pacman -S i3 feh arandr ttf-font-awesome lxappearance thunar rofi compton \
	i3blocks dialog wpa_supplicant iw ctags yay

git clone https://github.com/supermarin/YosemiteSanFranciscoFont
mkdir -p $FONT_DIR
mv YosemiteSanFranciscoFont/*.ttf $FONT_DIR
