export PATH=$HOME/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias d='cd $HOME/Downloads'

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

