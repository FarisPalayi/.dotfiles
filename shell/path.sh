#!/bin/bash
# PATH modifications for both shells
# This consolidates PATH changes from both your .bashrc and .zshrc

# Add local bin to PATH - From your existing configs
export PATH="$HOME/.local/bin:$PATH"  # EXISTING: From both files

# Add custom scripts directory if it exists - NEW but safe
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"     # NEW: Common practice for user scripts
fi

# Google Cloud SDK paths - From your existing .zshrc, made shell-agnostic
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then
    source "$HOME/google-cloud-sdk/path.bash.inc"    # EXISTING: From .zshrc
fi

# Alternative path for different shell types
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && [ -n "$ZSH_VERSION" ]; then
    source "$HOME/google-cloud-sdk/path.zsh.inc"     # EXISTING: From .zshrc
fi
