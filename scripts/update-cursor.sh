#!/bin/bash

APPDIR=/opt
APPNAME="cursor.AppImage"
APPIMAGE_URL="https://downloader.cursor.sh/linux/appImage/x64"
sudo rm $APPDIR/$APPNAME

wget -O $APPDIR/cursor.AppImage $APPIMAGE_URL
chmod +x $APPDIR/cursor.AppImage
