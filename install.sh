#!/bin/bash
# Dotfiles installation script

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "Creating backup in $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

# Backup existing files
for file in .bashrc .zshrc .profile .bash_profile; do
    [ -f "$HOME/$file" ] && cp "$HOME/$file" "$BACKUP_DIR/"
done
[ -d "$HOME/.config/shell" ] && cp -r "$HOME/.config/shell" "$BACKUP_DIR/"

echo "Installing dotfiles..."
mkdir -p "$HOME/.config"
cp -r "$DOTFILES_DIR/shell" "$HOME/.config/"
cp "$DOTFILES_DIR/.bashrc" "$HOME/"
cp "$DOTFILES_DIR/.zshrc" "$HOME/"
cp "$DOTFILES_DIR/.profile" "$HOME/"
cp "$DOTFILES_DIR/.bash_profile" "$HOME/"

echo "✅ Dotfiles installed! Restart your shell or run 'source ~/.bashrc'"
