#!/bin/bash
# Useful functions for both shells - ALL NEW but commonly used

# Create directory and cd into it - Very common utility function
mkcd() {
    if [ $# -ne 1 ]; then
        echo "Usage: mkcd <directory_name>"
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

# Extract various archive formats - Handy utility function
extract() {
    if [ $# -ne 1 ]; then
        echo "Usage: extract <archive_file>"
        return 1
    fi
    
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick HTTP server - Uses Python like your existing setup
serve() {
    local port=${1:-8000}
    echo "Starting HTTP server on port $port..."
    echo "Access at: http://localhost:$port"
    python3 -m http.server "$port"
}

# Show current PATH in readable format - Debugging utility
showpath() {
    echo "$PATH" | tr ':' '\n' | nl
}
