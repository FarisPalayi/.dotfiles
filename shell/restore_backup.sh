# Restore from backup
LATEST_BACKUP=$(ls -t ~/dotfiles_backup/ | head -n 1)
cp ~/dotfiles_backup/$LATEST_BACKUP/* ~/

# Or disable specific parts by commenting out lines in the main files
# Edit ~/.bashrc or ~/.zshrc and comment out problematic source lines
