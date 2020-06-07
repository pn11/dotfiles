#!/bin/bash

## Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
cat Homebrew/mojave.brew.list | xargs brew install
cat Homebrew/mojave.cask.list | xargs brew cask install
cat Homebrew/mojave.mas.list | xargs mas install
