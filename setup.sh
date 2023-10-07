#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

declare -a dotfiles=(".zshrc" ".vimrc" ".gitconfig")

backup_existing() {
  for file in "${dotfiles[@]}"; do
    if [ -f "$HOME/$file" ]; then
      echo "Backing up existing $file to $file.bak"
      mv "$HOME/$file" "$HOME/$file.bak"
    fi
  done
}

create_symlinks() {
  for file in "${dotfiles[@]}"; do
    echo "Creating symlink for $file"
    if [ -f "$DOTFILES_DIR/$file" ]; then
      ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
      echo "Symlinked $file to $DOTFILES_DIR/$file"
    else
      echo "Skipping $file - File not found in dotfiles directory."
    fi
  done
}

setup_dotfiles() {
  echo "Setting up dotfiles..."
  backup_existing
  create_symlinks
  echo "Dotfiles setup complete."
}


setup_dotfiles
