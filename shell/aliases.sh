#!/bin/bash
# Common aliases for both bash and zsh

# Python aliases - EXISTING: From your .zshrc
alias python='python3.11'
alias pip='pip3.11'
alias pytest='python -m pytest'

# Enhanced ls commands - EXISTING: From your .bashrc
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# Directory navigation - NEW but very common and safe
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Grep with color - EXISTING: From your .bashrc
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git shortcuts - NEW but optional (commonly used)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git oneline'

# System shortcuts - NEW but helpful for config management
alias edit-bash='${EDITOR:-nano} ~/.bashrc'
alias edit-zsh='${EDITOR:-nano} ~/.zshrc'
alias please='sudo'

if [ -n "$ZSH_VERSION" ]; then
  alias reload-shell='exec zsh'
elif [ -n "$BASH_VERSION" ]; then
  alias reload-shell='source ~/.bashrc'
fi

alias cls='clear'

# Safety nets - NEW but important for preventing accidents
alias rm='rm -i'    # Prompt before removing files
alias cp='cp -i'    # Prompt before overwriting files
alias mv='mv -i'    # Prompt before overwriting files

# Long running command alert - EXISTING: From your .bashrc
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Development shortcuts
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Docker shortcuts (if you use Docker)
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias dexec='docker exec -it'

# Quick file operations
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

