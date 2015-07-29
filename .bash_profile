#!/usr/bin/env bash

export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'
export GOROOT=""
unset MAILCHECK # Don't check mail when opening terminal.

PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\$\[\033[00m\] "

if [ -f ~/.alias ]; then
    . ~/.alias
fi

export PATH=/home/williamsj/bin/Sencha/Cmd/5.1.3.61:$PATH
export KLE=/home/williamsj/gocode/src/github.com/Novetta/KLE
export PERSEUS=/home/williamsj/gocode/src/github.com/Novetta/perseus
export VIDEX=/home/williamsj/gocode/src/github.com/Novetta/VideoEnterprise
export COMMON=/home/williamsj/gocode/src/github.com/Novetta/common
export PWCOP=/home/williamsj/gocode/src/github.com/Novetta/pwcop
export SENCHA_CMD_3_0_0="/home/williamsj/bin/Sencha/Cmd/5.1.3.61"
unset GOROOT

export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/
export PATH=$PATH:/usr/lib/jvm/jre1.7.0-openjdk.x86_64/bin/
export PATH="/home/williamsj/bin/Sencha/Cmd:$PATH"
