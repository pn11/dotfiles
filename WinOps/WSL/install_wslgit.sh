#/bin/bash

INSTALL_DIR=/mnt/c/Applications
INSTALL_DIR_WIN=$(wslpath -w $INSTALL_DIR)

if [ -d $INSTALL_DIR ] 
then
    : # Do nothing
else
    mkdir $INSTALL_DIR
fi

wget https://github.com/andy-5/wslgit/releases/download/v0.7.0/wslgit.exe -O /mnt/c/Applications/wslgit.exe

if [ $? -eq 0 ]
then
    echo "wslgit installed into $INSTALL_DIR."
    echo "Please set \"git.path\":\"$INSTALL_DIR_WIN\/wslgit.exe\" in settings.json."
fi