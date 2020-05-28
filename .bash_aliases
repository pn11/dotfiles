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

alias portcheck="nc -vz"
alias dkrun="docker run -it --rm"
alias gterm="gnome-terminal"
alias gnuplotp="gnuplot -persist"
alias rubyNoWarn="ruby -W0"
alias activate="source venv/bin/activate"
alias act="activate"
alias rmbac="rm *~"
alias check_latest="ls -l1r | head -1 | xargs tail -f"

if [ `which bat` ];then
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
