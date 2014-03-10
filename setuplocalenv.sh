#!/bin/bash

export PATH=$HOME/bin:$PATH

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias q='exit'
alias e='exit'
alias d='cd $HOME/Downloads'
alias dev='cd $HOME/dev'
alias u='cd ..'

# SBT 
export SBT_OPTS="-Xmx1024M -XX:MaxPermSize=512m -XX:ReservedCodeCacheSize=128m"

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
