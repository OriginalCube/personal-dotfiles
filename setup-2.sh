#!/usr/bin/env bash

# Define the base directory where your dotfiles are
base_dir="$HOME/.local/personal-dotfiles"

# Define the directory where the symlinks should be created
target_dir="$HOME/.config"

# Ensure target subdirectories exist
mkdir -p "$target_dir/Code/User"

# VSCode symlinks
ln -sf "$base_dir/.vscode/settings.json" "$target_dir/Code/User/settings.json"
ln -sf "$base_dir/.vscode/keybindings.json" "$target_dir/Code/User/keybindings.json"

# zsh config (overwrite existing .zshrc if needed)
ln -sf "$base_dir/zsh/.zshrc" "$HOME/.zshrc"
