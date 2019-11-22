#!/bin/bash

alias bashrc="emacs -nw ~/.bashrc"
alias emacsn="emacs -nw"
alias nemacs="emacs -nw"
alias neamcs="emacs -nw"
alias neamcs="emacs -nw"

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

alias portcheck="nc -vz"
alias dkrun="docker run -it --rm"
alias gterm="gnome-terminal"
alias gnuplotp="gnuplot -persist"
alias rubyNoWarn="ruby -W0"
alias activate="source venv/bin/activate"
alias rmbac="rm *~"

if [ `which bat` ];then
    alias cat=bat
    alias less=bat
fi

###Emacs daemon###
alias emacsd="emacs --daemon"
alias E="emacsclient -t -a \"\""
alias kill-emacs="emacsclient -e '(kill-emacs)'"

###screen###
#http://tm.root-n.com/unix:command:screen
#screen -xR
alias scls="screen -ls"
alias scr="screen -r"
alias scd="screen -d"
