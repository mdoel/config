set -o emacs
alias ls="ls -CF"
alias ss='./script/server'
alias sc='./script/console'
alias sg='./script/generate'
alias cdt='cd $HOME/src/threadsuite/api'
alias cdm='cd $HOME/src/messiahumc'
alias cd2='cd $HOME/src/T2'
alias sshp='ssh mdoel@proxy.resortgems.com'
alias cdc='cd $HOME/src/config'
alias cdv='cd $HOME/src/vidio'
alias r="script/rails"
alias prod='heroku console --app rrbo'
alias staging='heroku console --app staging-rrbo'
alias mig='rake db:migrate db:test:prepare'
alias dbc='script/dbconsole'
alias cucumber='cucumber -r features'
alias cuke='cucumber'
alias smoke="cucumber -p smoke"
alias dos2unix='dos2unix -c mac'
alias mvim='mvim 2>/dev/null'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim 2>/dev/null'
# alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim 2>/dev/null'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias t2db='cp config/database.sample.yml config/database.yml'


# Git aliases
alias gx="gitx --all"
alias gst='git status'
alias g='git'
alias push='git push'
alias pull='git pull'

export PAGER=less
export EDITOR=mvim
export PATH=./bin:/usr/local/heroku/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/pgsql/bin
export MANPATH=$MANPATH:/usr/local/man
export FTP_PASSIVE=1
export RSPEC=true
export GOOGLE_CLIENT_ID="480140443980.apps.googleusercontent.com"
export GOOGLE_SECRET="v03dRPvKlgn_OsK79MXSDn5j"


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
