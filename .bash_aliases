#!/bin/bash

alias gr=grep
alias exclude="grep -v"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsdir="ls -F | grep /"
alias wcl="wc -l"
alias tailf="tail -f"
alias psall="ps -fae"
alias lns="ln -s"
alias weather="curl wttr.in/Kyoto"
alias rsync_easy="rsync -ahvtr"
alias tar_easy="tar zxvf"
alias up="cd ../"
alias upup="cd ../../"
alias gi="git"
alias extract="dtrx"

alias portcheck="nc -vz"
alias gterm="gnome-terminal"
alias gnuplotp="gnuplot -persist"
alias rubyNoWarn="ruby -W0"
alias activate="if [ -e venv/bin/activate ]; then \
  source venv/bin/activate; \
elif [ -d node_modules/.bin ]; then \
  PATH=$(pwd)/node_modules/.bin:$PATH; \
else
  echo 'Do nothing.'; \
fi"
alias act="activate"
alias rmbac="rm *~"
alias check_latest="ls -l1r | head -1 | xargs tail -f"

# If bat is installed, use it instead of less
if command -v bat >>/dev/null 2>&1; then
    alias less=bat
fi

###Emacs daemon###
alias emacsd="emacs --daemon"
# emacsclient -t -a "" で alternative editor = "" だと daemon を自動起動するが、
# load path を指定すると client が起動してくれない。
#alias E="emacsclient -t -a \"emacs --daemon -l ~/.emacs\""
alias E="emacsclient -t -a \"emacs --daemon\""
alias kill-emacs="emacsclient -e '(kill-emacs)'"

###screen###
#http://tm.root-n.com/unix:command:screen
#screen -xR
alias scls="screen -ls"
alias scr="screen -r"
alias scd="screen -d"

###Tmux###
alias tmux="tmux -u"

###Docker###
alias dkrun="docker run -it --rm"
alias dcon="docker-compose"
alias dcup="docker-compose up"
alias dcdown="docker-compose down"
alias dcps="docker-compose ps"
alias dclogs="docker-compose logs"
alias dclog="dclogs"
alias dcexec="docker-compose exec"
alias docker-kill-all="docker ps | awk '{print \$1}' | grep -v 'CONTAINER' | xargs docker kill"
alias docker-rm-all="docker ps -a | awk '{print \$1}' | grep -v 'CONTAINER' | xargs docker rm"
alias ctop="docker run --rm -ti \
  --name=ctop \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  quay.io/vektorlab/ctop:latest"

alias journal="E +999999 ~/git/OkaNotes/2020/journal.md"
alias j=journal

### Python ###
alias venv="python3 -m venv"
