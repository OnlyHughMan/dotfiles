#!/bin/bash

# Check if OBSIDIAN_PATH is set
if [ -z "$OBSIDIAN_PATH" ]; then
    echo "OBSIDIAN_PATH is not set. Please set it before running the script."
    exit 1
fi

echo "OBSIDIAN_PATH: $OBSIDIAN_PATH"

# Change to the Obsidian directory
#obsidian_dir="$HOME/$OBSIDIAN_PATH"
#if [ ! -d "$obsidian_dir" ]; then
#    echo "Directory $obsidian_dir does not exist."
#    exit 1
#fi

cd "$obsidian_dir" || { echo "Failed to change directory"; exit 1; }

# Show current directory
echo "Current directory: $(pwd)"

# Git commands
git add .
git commit -m "update notes"
git push

