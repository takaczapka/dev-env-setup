#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PATH=$HOME/bin:$PATH:node_modules/.bin:$DIR/bin

export PS1="\[\e]0;\w\a\]\n\$(${EMOTE}) \[\e[32m\]\u@\h \[\e[33m\]\w\e[0m\]\n\$ "

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

export dev=~/dev
export projects=$dev/projects

export CDPATH=${CDPATH}:${dev}:${projects}:~

# Aliases
alias ls='ls -hG'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias q='exit'
alias e='exit'
alias d='cd $HOME/Downloads'
alias dev='cd $HOME/dev'
alias u='cd ..'
alias ..='cd ..'
alias pa="ps aux"
alias du='du -kh'    # Makes a more readable output.
alias df='df -kh'
alias h='history'
alias mkdir='mkdir -p'
alias test-push='read -p "All changes locally committed? [Enter]..." && git pull --rebase && sbt clean test && git push'
alias http='python -mSimpleHTTPServer'

# PSEUDO ALIASES FOR COMMONLY USED LONG COMMANDS 
# from http://cfenollosa.com/misc/tricks.txt
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps axu | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function fnamegrep() { find . -type f -name "$1" -exec grep -i $2 {} \; ; }
#  removes lines from $1 if they appear in $2
function remove_lines_from() { grep -F -x -v -f $2 $1; }
function mcd() { mkdir $1 && cd $1; }

# SBT 
export SBT_OPTS="-Xmx2024M -XX:ReservedCodeCacheSize=128m"

function jkill(){
  local to_kill=$1
  local pids=`jps | grep -i $to_kill | awk '{ print $1 }'`
  if [[ -n "$pids" ]]
  then
    kill -9 $pids
    echo "Killed Java processes for" \"$to_kill\" "with pid(s):" $pids
  else 
    echo "Nothing to kill"
  fi
}

# automatically fixes your 'cd folder' spelling mistakes
shopt -s cdspell

. "$DIR"/gitconfig.sh


# requires > brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# requires > brew install thefuck
eval $(thefuck --alias)

echo "Environment setup... DONE. Hello `whoami`!"
