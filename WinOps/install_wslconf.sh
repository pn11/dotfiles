#!/bin/bash

if [ -f /etc/wsl.conf ]
then
    SCRIPT_DIR=$(cd $(dirname $0); pwd)
    sudo cp $SCRIPT_DIR/wsl.conf /etc/wsl.conf
fi
