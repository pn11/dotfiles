#!/bin/bash
# このファイルはインターネットからダウンロードして実行することを意図しているため、
# 処理を細かくファイルに分けるのではなく、なるべくこのファイルだけで完結するようにする

sudo apt-get update
sudo apt-get install -y build-essential curl file git

if [ ! -e /home/linuxbrew/.linuxbrew ] && [ ! -e ~/.linuxbrew ]; then
    echo "Installing Linuxbrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi

PATH=~/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin:$PATH
curl -fsSL https://raw.githubusercontent.com/pn11/dotfiles/master/WinOps/WSL/brew.list.MateBook | xargs brew install


PATH=~/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin:$PATH

if [ ! -e ~/git ]; then
    mkdir ~/git
fi

function clone_repo() {
    dirname=~/git/$(echo ${1} | sed 's/.*\///g')
    if [ -e $dirname ]; then
        return
    fi
    pushd ~/git
    git clone git@github.com:${1}.git ${dirname}
    popd
}

clone_repo pn11/dotfiles
pushd ~/git/dotfiles
ruby install.rb
pushd WinOps/WSL
bash install_wslgit.sh
pip3 install -r requirements.txt
popd

clone_repo pn11/dotfiles-private
pushd ~/git/dotfiles-private
ruby install.rb
popd

clone_repo pn11/benkyokai
clone_repo pn11/cheat
clone_repo pn11/location-grass
clone_repo pn11/OkaNotes
clone_repo pn11/OkaScripts
clone_repo pn11/pn11.github.io