#!/bin/bash

set -e

PREFIX=/usr/local
SYSTEMD_DIR=/lib/systemd/system

DOWNLOAD_DIR="`pwd`/downloads"
DOWNLOAD_URL_PREFIX="https://github.com/containous/traefik/releases/download/"
SS_VERSION="v1.7.2"
ORIG_BIN="traefik_linux-amd64"
BIN="traefik"

CONFIG=config.toml
SITE_CONFIG=ericnode.info.toml
SERVICE=traefik.service

check_user() {
    if [ "$(id -u)" != "0" ]; then
        echo "This script must be run as root." 1>&2
        exit 1
    fi
}

print_usage() {
    echo "Usage: $0 <cmd>"
    echo "  cmd: download, install, restart, uninstall, clean"
}

download() {
    echo "Download traefik ..."
    mkdir -p $DOWNLOAD_DIR
    wget "$DOWNLOAD_URL_PREFIX/$SS_VERSION/$ORIG_BIN" -O $DOWNLOAD_DIR/$BIN
}

do_install() {
    echo "Install traefik ..."
    install -v $DOWNLOAD_DIR/$BIN $PREFIX/bin
    install -v $CONFIG $PREFIX/share/
    install -v $SITE_CONFIG $PREFIX/share/
    install -v $SERVICE $SYSTEMD_DIR
    systemctl enable $SERVICE
}

uninstall() {
    echo "Uninstall traefik ..."
    systemctl stop $SERVICE
    systemctl disable $SERVICE
    rm -fv $PREFIX/bin/$BIN
    rm -fv $PREFIX/share/$CONFIG
    rm -fv $PREFIX/share/$SITE_CONFIG
    rm -fv $SYSTEMD_DIR/$SERVICE
}

case "$1" in
	"download") download;;
	"install") check_user; do_install;;
    "restart") check_user; systemctl restart $SERVICE;;
    "stop") check_user; systemctl stop $SERVICE;;
    "status") systemctl status $SERVICE;;
    "uninstall") check_user; uninstall;;
    "log") journalctl -f -u $SERVICE;;
    "clean") rm -rf $DOWNLOAD_DIR;;
	*) print_usage;;
esac
