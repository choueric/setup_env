#!/bin/sh

# $1: absolute path of patch file
# $2: absolute path of dest directory
apply_patch() {
    cd $2
    patch -p1 < $1
    cd -
}

apply_patch $PWD/fzf-key-bindings.patch $HOME/.fzf
