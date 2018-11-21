#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [[ $DISPLAY ]]; then
    [[ -z "$TMUX" ]] && exec tmux
fi
