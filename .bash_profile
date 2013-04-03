[[ -s "/Users/anders/.rvm/scripts/rvm" ]] && source "/Users/anders/.rvm/scripts/rvm"

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

parse_svn_branch() {
  svn info 2> /dev/null | grep '^URL:' | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$' | sed -e 's/\(.*\)/[\1]/'
}
 
export PS1='\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\] '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

if [ -f /opt/local/etc/bash_completion ]; then
      . /opt/local/etc/bash_completion
  fi

alias slt='open -a "Sublime Text 2"'
alias reload='source ~/.bash_profile'

