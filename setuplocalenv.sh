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
alias pp="ps axuf | pager"

# PSEUDO ALIASES FOR COMMONLY USED LONG COMMANDS 
# from http://cfenollosa.com/misc/tricks.txt
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
#  removes lines from $1 if they appear in $2
function remove_lines_from() { grep -F -x -v -f $2 $1; }
function mcd() { mkdir $1 && cd $1; }

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

# automatically fixes your 'cd folder' spelling mistakes
shopt -s cdspell