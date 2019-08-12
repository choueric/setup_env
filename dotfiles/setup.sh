#!/bin/bash

# set -x
# set -e

readonly QUICK_LINK_FILES=(vimrc bashrc git-completion.bash tmux.conf gitconfig
    ctags xmodmaprc setup_bash.sh)
readonly CONFIG_FOLDERS=(i3 dunst ranger)

flagForce=0

# $1: file/folder to test
is_symlink() {
    if [ -L $1 ]; then
        echo "yes"
    else
        echo "no"
    fi
}

copy_file() {
	echo "#### install [$1] ####"
	if [ -e ~/.$1 ]; then
		mv -f ~/.$1 ~/.$1.bak
	fi
	ln -s `pwd`/$1 ~/.$1
}

# $1: absolute path of dest
# $2: absolute path of source
link() {
    dest=$1
    src=$2
    if [ $(is_symlink $dest) = "yes" ] && [ $flagForce -ne 1 ]; then
        echo "$dest is already a symlink, skip"
        return
    fi
    echo "$dest -> $src"
    ln -sf "$src" "$dest"
}

# $1: config file name
quick_link() {
    link $HOME/.$1 $PWD/$1
}

list_link() {
    ls -F --color=always -l $1 | sed 's/^\([^[:blank:]]\{1,\}[[:blank:]]\{1,\}\)\{8\}//'
}

################################################################################

do_list() {
    for f in "${QUICK_LINK_FILES[@]}"; do
        list_link $HOME/.$f
    done

    for f in "${CONFIG_FOLDERS[@]}"; do
        list_link $HOME/.config/$f
    done
}

do_link() {
    for f in "${QUICK_LINK_FILES[@]}"; do
        quick_link $f
    done

    for f in "${CONFIG_FOLDERS[@]}"; do
        link $HOME/.config/$f $PWD/config/$f
    done
}

case $1 in
    "--list") do_list;;
    "--force") flagForce=1; do_link;;
    *) do_link;;
esac
