#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

alias ls='ls --color=auto'
alias wf='cd ~/work/workforce && pipenv shell'
alias com='cd ~/work/compliance'
alias vi='vim'
alias shutdown='echo "logout" $(date +"%c") >> ~/.login_history.log && shutdown now'

source ~/git-completion.bash
PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]]\$ '

alias config='/usr/bin/git --git-dir=/home/stickybits/.cfg/ --work-tree=/home/stickybits'
