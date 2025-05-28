#!/bin/bash
# quick-update.sh
# Simple script for quick dotfiles updates

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔄 Quick dotfiles update..."

# Copy main config files
cp ~/.bashrc "$SCRIPT_DIR/"
cp ~/.zshrc "$SCRIPT_DIR/"
cp ~/.profile "$SCRIPT_DIR/"
cp ~/.bash_profile "$SCRIPT_DIR/"

# Copy shell modules
mkdir -p "$SCRIPT_DIR/shell"
cp ~/.config/shell/* "$SCRIPT_DIR/shell/"

echo "✅ Files updated!"

# Show git status if in a git repo
if [ -d "$SCRIPT_DIR/.git" ]; then
    cd "$SCRIPT_DIR"
    echo
    echo "📊 Git status:"
    git status --short
    
    echo
    echo "💡 Quick commit:"
    echo "  git add . && git commit -m \"Update $(date +'%Y-%m-%d %H:%M')\""
fi

echo "🎉 Done!"
