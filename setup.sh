#!/bin/sh

set -x
set -e

if [ -e ~/.vimrc ]; then
	mv -f ~/.vimrc ~/.vimrc.bak
fi
ln -s `pwd`/vimrc ~/.vimrc

if [ -e ~/.bashrc ]; then
	mv -f ~/.bashrc ~/.bashrc.bak
fi
ln -s  `pwd`/bashrc ~/.bashrc

if [ -e ~/.git-completion.bash ]; then
	mv ~/.git-completion.bash ~/.git-completion.bash.bak
fi
ln -s `pwd`/git-completion.bash ~/.git-completion.bash

git config --global user.name choueric
git config --global user.email zhssmail@gmail.com
