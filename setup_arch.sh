#!/bin/bash

# for i3 in archlinux
FONT_DIR=~/.local/share/fonts

copy_file config/i3

pacman -S sudo tmux openssh
visudo
sudo pacman -S i3 feh arandr ttf-font-awesome lxappearance thunar rofi compton \
	i3blocks dialog wpa_supplicant iw ctags

git clone https://github.com/supermarin/YosemiteSanFranciscoFont
mkdir -p $FONT_DIR
mkdir -p workspace/builds
mv YosemiteSanFranciscoFont/*.ttf $FONT_DIR

sudo cp shadowsocks.service /etc/systemd/system/shadowsocks.service
sudo systemctl enable shadowsocks.service
sudo systemctl enable wpa_supplicant@wlp58s0
