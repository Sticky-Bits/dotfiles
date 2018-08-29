#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH=$PATH:~/scripts:$HOME/.cargo/bin:$PATH

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec ssh-agent startx
fi

