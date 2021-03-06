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
