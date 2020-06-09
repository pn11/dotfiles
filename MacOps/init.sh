#!/bin/bash
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/pn11/dotfiles/master/MacOps/init.sh)"

## Homebrew
if [ ! -e ~/.brew ]; then
    git clone --depth=1 https://github.com/Homebrew/brew.git
fi

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

pushd dotfiles/MacOps
brew update
cat Homebrew/mojave.brew.list | xargs brew install
cat Homebrew/mojave.cask.list | xargs brew cask install
cat Homebrew/mojave.mas.list | awk '{print $1}' | xargs mas install
