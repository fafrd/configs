#.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add bin to path
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:$HOME/bin"

# Dynamic resizing
shopt -s checkwinsize

# Custom prompt
tty -s && PS1="\[$(tput bold)\]\w \\$ \[$(tput sgr0)\]"

# Add color
eval `dircolors -b`

alias vi='vim'
alias tracert='traceroute'

# sudo
alias yum='sudo yum'
alias dnf='sudo dnf'
alias apt-get='sudo apt-get'
alias dpkg='sudo dpkg'
alias pacman='sudo pacman'
alias mount='sudo mount'

# docker
alias docker-rmi='docker rmi $(docker images -q)'
alias docker-rm='docker rm $(docker ps -a -q)'

# some aliases
#alias cat='lolcat'
alias ls='ls -h --color'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias temp='sensors | grep sensor\ ='

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# go
export GOROOT=$HOME/go
export GOPATH=$HOME/work
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
