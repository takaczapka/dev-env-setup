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

# GIT
alias gst='git status'
alias gadd='git add .'
gitAddCommit() { git add .; git commit -m "$1";}
alias gcommit='git commit -m "$1"'
alias gac=gitAddCommit
alias gpull='git pull --rebase'
alias gpush='gpull; git push'



