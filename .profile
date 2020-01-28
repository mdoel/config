set -o emacs
alias ls="ls -CF"
alias dos2unix='dos2unix -c mac'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias rc="rails console"

# Git aliases
alias gx="gitx --all"
alias gst='git status'
alias g='git'
alias push='git push'
alias pull='git pull'

export PAGER=less
export EDITOR=mvim

MYSQL=/usr/local/mysql/bin
export PATH=./bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=$MANPATH:/usr/local/man
export FTP_PASSIVE=1
export RSPEC=true

# trying to fix some bundle install weirdness.  Prior to this, by value was en_US.US-ASCII
export LANG='en_US.UTF-8'

# function for using Spotlight to find files with a specific name
function loc { mdfind "kMDItemDisplayName == '$@'wc"; }
function back {
  ack "$@" `bundle show --paths`
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
WHITE="\[\033[0;37m\]"
PS1="$GREEN\w$YELLOW \$(parse_git_branch)$GREEN\$ $WHITE"

eval "$(rbenv init -)"
