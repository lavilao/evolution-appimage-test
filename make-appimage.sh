#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q evolution | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/evolution-project/graphics/master/256x256.png
export DESKTOP=/usr/share/applications/org.gnome.Evolution.desktop

quick-sharun /usr/bin/evolution

quick-sharun --make-appimage

quick-sharun --test ./dist/*.AppImage
