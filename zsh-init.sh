#!/bin/zsh

DIR="$( cd "$( dirname "${(%):-%N}" )" && pwd )"

export PATH=$HOME/bin:$PATH
export dev=$HOME/dev

# Aliases
alias ls='ls -hGF'
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
alias grep='grep --color=auto'

# some useful docker aliases
# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

function wget-suck() { wget -m -k -K -E -l 7 -t 6 $1; }

# PSEUDO ALIASES FOR COMMONLY USED LONG COMMANDS
# from http://cfenollosa.com/misc/tricks.txt
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps axu | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function gname() { grep -R --include="$1" $2 .; }
function fnamegrep() { find . -type f -name "$1" -exec grep -i $2 {} \; ; }
#  removes lines from $1 if they appear in $2
function remove_lines_from() { grep -F -x -v -f $2 $1; }
function mcd() { mkdir $1 && cd $1; }

function tgz() { tar -zcvf $1.tar.gz $1; }
function untgz() { tar -zxvf $1; }

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

function runs-on-port() {
  lsof -n -i :$1 | grep LISTEN
}

. "$DIR"/gitconfig.sh

export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_14_HOME=$(/usr/libexec/java_home -v14)

alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java14='export JAVA_HOME=$JAVA_14_HOME'

# default to Java 14
java14
