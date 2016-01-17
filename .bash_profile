#!/usr/bin/env bash

export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'
export GOROOT=""
unset MAILCHECK
# Don't check mail when opening terminal.

PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\$\[\033[00m\] "

if [ -f ~/.alias ]; then
    . ~/.alias
fi

alias python=/usr/local/bin/python2.7
export PYTHONPATH=/usr/lib/python2.7/site-packages
export PATH="/usr/local/bin:$PATH"
unset GOROOT

export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/
export PATH=$PATH:/usr/lib/jvm/jre1.7.0-openjdk.x86_64/bin/
