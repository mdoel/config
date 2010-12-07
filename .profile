set -o emacs
alias ls="ls -CF"
alias ett='mate app config lib db public test spec features &'
alias mvim='mvim 2>/dev/null'
alias ss='./script/server'
alias sc='./script/console'
alias sg='./script/generate'
alias cdt='cd $HOME/src/triptastic'
alias cdr='cd $HOME/src/rgproxy'
alias sshp='ssh mdoel@proxy.resortgems.com'
alias cdc='cd $HOME/src/config'
alias cdb='cd $HOME/src/config/.vim/bundle'
alias prod='heroku console --app rrbo'
alias staging='heroku console --app staging-rrbo'
alias mig='rake db:migrate db:test:prepare'
alias gst='git status'
alias dbc='script/dbconsole'
alias cucumber='cucumber -r features'
alias cuke='cucumber'
alias smoke="cucumber -p smoke"
alias rc="script/runner services/reset_cache.rb"
alias gx="gitx --all"
export PAGER=less
export EDITOR=mvim
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/mysql/bin:/usr/local/git/bin
export MANPATH=$MANPATH:/usr/local/man
export FTP_PASSIVE=1
export RSPEC=true

export REDWEEK_USER_ID=rwhittier2010@gmail.com
export REDWEEK_PASSWORD=daaaaaaaaa

if [[ -f ~/.keys ]] ; then . ~/.keys ; fi

# function for using Spotlight to find files with a specific name
function loc { mdfind "kMDItemDisplayName == '$@'wc"; }


##
# Your previous /Users/mdoel/.profile file was backed up as /Users/mdoel/.profile.macports-saved_2009-01-23_at_10:05:38
##

# MacPorts Installer addition on 2009-01-23_at_10:05:38: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:/usr/local/pgsql/bin
export PGOPTIONS='-c client_min_messages=WARNING'

# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-01-23_at_10:05:38: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.



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

##
# Your previous /Users/mdoel/.profile file was backed up as /Users/mdoel/.profile.macports-saved_2009-08-31_at_22:36:24
##

# MacPorts Installer addition on 2009-08-31_at_22:36:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
