set -o emacs
alias ls="ls -CF"
alias dos2unix='dos2unix -c mac'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias prod='heroku run console -r production'
alias staging="heroku run console -r staging"
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
export PATH=./bin:$HOME/bin:/usr/local/bin:/usr/local/sbin
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


export PGOPTIONS='-c client_min_messages=WARNING'

#rake tab completion
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
  COMPREPLY=($(compgen -W "`rake -s -T 2>/dev/null | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _rakecomplete rake

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