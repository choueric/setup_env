#!/bin/sh

set -x
set -e

function copy_file {
	echo "#### install [$1] ####"
	if [ -e ~/.$1 ]; then
		mv -f ~/.$1 ~/.$1.bak
	fi
	ln -s `pwd`/$1 ~/.$1
}

copy_file vimrc
copy_file bashrc
copy_file git-completion.bash
copy_file tmux.conf

git config --global user.name choueric
git config --global user.email zhssmail@gmail.com
