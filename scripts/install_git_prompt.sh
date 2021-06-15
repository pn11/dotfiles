#!/bin/bash
if command -v wget >>/dev/null 2>&1; then
    :
else
    echo "please install wget to install git-complettion and git-prompt."
    exit
fi

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.bash_completion.d/git-completion.bash
chmod a+x ~/.bash_completion.d/git-completion.bash
source ~/.bash_completion.d/git-completion.bash

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh
source ~/.git-prompt.sh
