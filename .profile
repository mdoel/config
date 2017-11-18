set -o emacs
alias ls="ls -CF"
alias dos2unix='dos2unix -c mac'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias t2db='cp config/database.sample.yml config/database.yml'
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
export PATH=./bin:/usr/local/heroku/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH:$MYSQL:/usr/local/share/npm/bin
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
export MANPATH=$MANPATH:/usr/local/man
export FTP_PASSIVE=1
export RSPEC=true
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export GOOGLE_CLIENT_ID="232261124658-jgt6f7do64vfpb4q7q9qggci2kijdl9u.apps.googleusercontent.com"
export GOOGLE_SECRET="rle3y1kdyQarvYI2dnj3aKQG"


# trying to fix some bundle install weirdness.  Prior to this, by value was en_US.US-ASCII
export LANG='en_US.UTF-8'

if [[ -f ~/.keys ]] ; then . ~/.keys ; fi

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

_capcomplete() {
  COMPREPLY=($(compgen -W "`cap  -T  2>/dev/null| awk '{{ if ( $3 ~ /\#/ ) print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _rakecomplete rake
complete -o default -o nospace -F _capcomplete cap

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

# export CC=gcc-4.2

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
