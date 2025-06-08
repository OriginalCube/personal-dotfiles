#!/bin/bash

# Define an array of source paths (edit these!)
base_dir="$HOME/.local/personal-dotfiles"
sources=(
    "fastfetch"
    "hypr"
    "kitty"
    "waybar"
    "wlogout"
)

# Define the directory where the symlinks should be created
target_dir="$HOME/.config"

# Loop through each source path
for src in "${sources[@]}"; do
    # Check if source exists
    if [ -e "$src" ]; then
        # Get the base name of the source (e.g., file.txt from /path/to/file.txt)

        # Create the symlink in the target directory
        ln -s "$base_dir/$src" "$target_dir"

        echo "Linked $base_dir/$src → $target_dir"
    else
        echo "Warning: Source path not found - $src"
    fi
done

