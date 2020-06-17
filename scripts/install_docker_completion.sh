#!/bin/bash

# Docker
curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker > ~/.bash_completion.d/docker
chmod a+x ~/.bash_completion.d/docker
source ~/.bash_completion.d/docker

# Docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > ~/.bash_completion.d/docker-compose
chmod a+x ~/.bash_completion.d/docker-compose
source ~/.bash_completion.d/docker-compose

