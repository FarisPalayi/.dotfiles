#!/bin/bash
# Common environment variables for both bash and zsh
# This file is sourced by both .bashrc and .zshrc

# History settings - Enhanced from your current setup
export HISTSIZE=10000                    # NEW: Increased from 1000
export HISTFILESIZE=20000               # NEW: Increased from 2000
export HISTCONTROL=ignoreboth:erasedups # NEW: Added erasedups to remove duplicates

# Editor preferences - Safe defaults
export EDITOR='vim'    # NEW: Default editor
export VISUAL='nano'    # NEW: Visual editor for programs that need it

# Language settings - Standard UTF-8 setup
export LANG=en_US.UTF-8   # NEW: Explicit language setting
export LC_ALL=en_US.UTF-8 # NEW: Locale setting

# Colors for ls command - Enhanced colors
export CLICOLOR=1                                    # NEW: Enable colors
export LSCOLORS=ExFxBxDxCxegedabagacad              # NEW: Color scheme for ls

# Python settings - Matches your existing aliases
export PYTHONPATH="$HOME/.local/lib/python3.11/site-packages:$PYTHONPATH" # NEW: Python path

# Node Version Manager - From your existing .zshrc
export NVM_DIR="$HOME/.nvm"  # EXISTING: Moved here for sharing

# For GPG signing
export GPG_TTY=$(tty)

# cd command shortcuts.
export CDPATH=".:~:/mnt/c/Users/ACER/Personal/Coding/Write-Code/projects/active"
