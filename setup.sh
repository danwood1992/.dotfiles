#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

# List to symlink
declare -a dotfiles=("zshrc" "vimrc" "gitconfig")

# Function to create symlinks
create_symlinks() {
  for file in "${dotfiles[@]}"; do
    if [ -f "$HOME/.$file" ]; then
      echo "Backing up existing .$file to .$file.bak"
      mv "$HOME/.$file" "$HOME/.$file.bak"
    fi
    ln -s "$DOTFILES_DIR/$file" "$HOME/.$file"
    echo "Symlinked .$file to $DOTFILES_DIR/$file"
  done
}

main() {
  echo "Setting up dotfiles..."
  create_symlinks
  echo "Dotfiles setup complete."
}

main
