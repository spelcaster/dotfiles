VBOX_USB=usbfs

alias ls='ls --color=auto'
alias tailf='tail -f'
alias gitj="git commit -m \"annotations from $(date +'%Y-%m-%d %H:%M')\""
alias vimj="vim $(date +'%Y%m%d').md"
alias poweroff='sh ~/bin/see_you_space_cowboy.sh; sleep 1; poweroff'
alias reboot='sh ~/bin/see_you_space_cowboy.sh; sleep 1; reboot'

export PATH=$PATH:$HOME/bin:$HOME/.composer/vendor/bin:$HOME/.yarn/bin
export NODE_PATH=/usr/lib/node_modules:$NODE_PATH

if [[ $DISPLAY ]]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
fi
