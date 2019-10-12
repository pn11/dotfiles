# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac



# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# "10,000はやり過ぎだとおもうかもしれない。しかし、実際はこの程度ではむしろ手ぬるい。漢はもはや一度入力したコマンドは未来永劫直接入力はしないものだ。回りを見渡すと億単位を越えてありえないサイズを指定している人もいる。"(http://news.mynavi.jp/column/zsh/003/)
HISTSIZE=100000
HISTFILESIZE=100000
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTIGNORE="bg*:ls:pwd*:cd:"    
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# less のキーバインド設定
[ -x /usr/bin/lesskey ] && lesskey

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Local settings.

if [ -f ~/.bashrc_local ] ; then
    . ~/.bashrc_local
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# DISPLAY環境変数が設定されていなかったら SSH クライアントを出力先に設定
# この [ -v ] は bash 4.2 で追加。cf. https://luna2-linux.blogspot.com/2014/05/bash.html
# ただし Mac の場合は brew install bash で 5.0 を入れても動かなかった。
if [ -v DISPLAY ]
then
    :
else
    export DISPLAY=`echo $SSH_CLIENT | awk '{print $1}'`:0.0
fi

# For Mac
if [ `uname` == "Darwin" ]
then
    if [ -f ~/.bashrc_mac ] ; then
        . ~/.bashrc_mac
    fi

# For WSL
elif [[ `uname -a` =~ Linux && `uname -a` =~ Microsoft ]]
then
    if [ -f ~/.bashrc_wsl ] ; then
        . ~/.bashrc_wsl
    fi
fi

# Local setting
if [ -f ~/.bashrc_local ]
then
    source ~/.bashrc_local
fi

# For yarn
if [ `which yarn` ]; then
    export PATH="$PATH:`yarn global bin`"
fi

# For Linuxbrew
if [ -d /home/linuxbrew ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

export NO_PROXY=localhost,127.0.0.1
# git-prompt and git-complete
# https://qiita.com/varmil/items/9b0aeafa85975474e9b6
if [ -f ~/.git-complete.bash ]; then
    source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

############### ターミナルのコマンド受付状態の表示変更
# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $
# PS1 はその場で評価して欲しいため double quote
# __git_ps1 は lazy eval して欲しいため single quote
export PS1="$PS1"'\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '

##############


# Temp
export PATH=$PATH:$HOME/git/OkaScripts/bin
