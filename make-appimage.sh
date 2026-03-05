#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q kontact | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/KDE/kontact/master/src/icons/256-apps-kontact.png
export DESKTOP=/usr/share/applications/org.kde.kontact.desktop

quick-sharun /usr/bin/kontact

quick-sharun --make-appimage

quick-sharun --test ./dist/*.AppImage
