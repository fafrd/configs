# env vars
export PATH=$PATH:$HOME/bin
export PATH=$HOME/.cargo/bin:$PATH

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export SERVER=k@192.168.1.9

# pretty colors
export TERM='xterm-256color'

# big history
SAVEHIST=10000000
HISTFILE=~/.bash_history

# alias commands to print colors. (even if they're being piped.)
alias ls='ls --color'
alias less='less -R'
alias grep='grep --color=always'

# vim keys
bindkey -v
bindkey '^R' history-incremental-search-backward

# alt left/right moves word
bindkey '^[b' backward-word
bindkey '^[f' forward-word

# backspace has expected behavior in edit mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# prompt
export PROMPT="%F{50}%~%f %B%% %b"

# show [vi] on the right side of prompt if we're in edit mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% vi mode]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# make man pages colorful
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# fzf autocompletion
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# update history immediately
setopt INC_APPEND_HISTORY_TIME

# nvm
export PATH=/Users/kian/.nvm/versions/node/v14.1.0/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# auto sudo
alias pacman="sudo pacman"
alias htop="sudo htop"
