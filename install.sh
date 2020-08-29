#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for file in $(cat dotfiles.list); do
    if [ ${file:0:1} = "#" ]; then
        continue
    fi
    target=${HOME}/${file}
    [ -e $target ]
    echo $?
    if [ -e $target ]; then
        echo "${target} exists."
    else
        ln -s ${SCRIPT_DIR}/${file} ${HOME}/${file}
        if [ $? -eq 0 ]; then
            echo $file installed.
        fi
    fi
done
