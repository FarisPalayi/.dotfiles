#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything - EXISTING
case $- in
    *i*) ;;
      *) return;;
esac

# Source shared configuration - NEW: This is the main change
[ -f ~/.config/shell/exports.sh ] && source ~/.config/shell/exports.sh
[ -f ~/.config/shell/path.sh ] && source ~/.config/shell/path.sh
[ -f ~/.config/shell/aliases.sh ] && source ~/.config/shell/aliases.sh
[ -f ~/.config/shell/functions.sh ] && source ~/.config/shell/functions.sh
[ -f ~/.config/shell/shared.sh ] && source ~/.config/shell/shared.sh

# Bash-specific settings - EXISTING with some enhancements
shopt -s histappend    # EXISTING: Append history instead of overwriting
shopt -s checkwinsize  # EXISTING: Check window size after each command
shopt -s cdspell       # NEW: Correct minor spelling errors in cd commands

# Enhanced history - NEW: Add timestamps to history
export HISTTIMEFORMAT="%d/%m/%y %T "

# Make less more friendly for non-text input files - EXISTING
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot - EXISTING
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Colored prompt - EXISTING
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# Terminal title - EXISTING
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# Enable color support of ls and grep - EXISTING
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Load bash completion - NEW but standard
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# NVM loading - EXISTING: From your original config
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Google Cloud SDK completion - EXISTING but fixed path
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then
    source "$HOME/google-cloud-sdk/completion.bash.inc"
fi

# Load local bash aliases if they exist - EXISTING
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
