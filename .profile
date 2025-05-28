#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is sourced by all POSIX-compatible shells

# Source shared configuration - NEW: For login shells
[ -f ~/.config/shell/exports.sh ] && . ~/.config/shell/exports.sh
[ -f ~/.config/shell/path.sh ] && . ~/.config/shell/path.sh

# If running bash, source ~/.bashrc - STANDARD practice
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
