source $HOME/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle battery
antigen bundle rand-quote
antigen bundle command-not-found
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme ys

# Tell antigen that you're done.
antigen apply

alias exit='sh ~/bin/see_you_space_cowboy.sh; sleep 2; exit'

export TERM='xterm-256color'
export PATH=$PATH:$HOME/.composer/vendor/bin

~/bin/gruvbox_palette.sh
~/bin/urxvt-meta.sh
