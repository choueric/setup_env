#!/bin/sh

set -x
set -e

mv -f ~/.vimrc ~/.vimrc.bak
ln -s `pwd`/vimrc ~/.vimrc

mv -f ~/.bashrc ~/.bashrc.bak
ln -s  `pwd`/bashrc ~/.bashrc

if -e ~/.git-completion.bash; then
	mv ~/.git-completion.bash ~/.git-completion.bash
fi
ln -s `pwd`/git-completion.bash ~/.git-completion.bash
