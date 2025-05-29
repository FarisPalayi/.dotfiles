#!/bin/zsh
# ~/.zshrc: zsh configuration

# Oh My Zsh installation path - EXISTING
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# fzf-tab
autoload -U compinit; compinit
source ~/fzf-tab/fzf-tab.plugin.zsh

# Oh My Zsh plugins - ENHANCED: Added useful plugins
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    git                      # EXISTING: From your config
    docker                   # NEW: Docker command completion
    node                     # NEW: Node.js completion
    npm                      # NEW: NPM completion  
    python                   # NEW: Python completion
    pip                      # NEW: pip completion
    history-substring-search # NEW: Search history with up/down arrows
    command-not-found        # NEW: Command not found completion
    sudo                     # NEW: sudo completion
)

# Source Oh My Zsh - EXISTING
source $ZSH/oh-my-zsh.sh

# Source shared configuration - NEW: Main change for modular config
[ -f ~/.config/shell/exports.sh ] && source ~/.config/shell/exports.sh
[ -f ~/.config/shell/path.sh ] && source ~/.config/shell/path.sh
[ -f ~/.config/shell/aliases.sh ] && source ~/.config/shell/aliases.sh
[ -f ~/.config/shell/functions.sh ] && source ~/.config/shell/functions.sh
[ -f ~/.config/shell/shared.sh ] && source ~/.config/shell/shared.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh-specific settings - NEW: Enhanced history options
setopt HIST_VERIFY          # Show command before executing from history
setopt SHARE_HISTORY        # Share history between all sessions
setopt APPEND_HISTORY       # Append to history file
setopt INC_APPEND_HISTORY   # Add commands to history immediately
setopt HIST_IGNORE_DUPS     # Don't record duplicate commands
setopt HIST_IGNORE_ALL_DUPS # Remove older duplicate commands
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks
setopt HIST_IGNORE_SPACE    # Don't record commands starting with space
setopt HIST_SAVE_NO_DUPS    # Don't save duplicate commands
setopt HIST_FIND_NO_DUPS    # Prevents showing any duplicates in history


# Case insensitive completion - NEW: Convenient completion
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color $realpath'

# NVM loading - EXISTING: From your original config
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Google Cloud SDK completion - EXISTING: From your original config
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
    source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi
. ~/z/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# set keybindings for autosuggestion and etc.
bindkey -e 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
