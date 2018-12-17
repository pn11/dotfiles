alias bashrc="emacs -nw ~/.bashrc"
alias emacsn="emacs -nw"
alias nemacs="emacs -nw"
alias gr=grep
alias exclude="grep -v"

# DISPLAY環境変数が設定されていなかったら SSH クライアントを出力先に設定
if [ -v DISPLAY ]
then
    :
else
    export DISPLAY=`echo $SSH_CLIENT | awk '{print $1}'`:0.0
fi

