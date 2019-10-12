#!/bin/bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
chmod a+x ~/.git-completion.bash
source ~/.git-completion.bash

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh
source ~/.git-prompt.sh
