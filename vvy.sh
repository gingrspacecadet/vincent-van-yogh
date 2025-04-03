#!/bin/bash

# Default value for the repo URL
repo_url=""

# Function to handle flags and inputs
while getopts "S:" flag; do
  case "${flag}" in
    S) repo_url="${OPTARG}" ;;  # The URL after -S is stored in repo_url
    *) echo "Usage: $0 [-S <repository_url>]" ;;
  esac
done

# Check if repo_url is provided
if [ -z "$repo_url" ]; then
  echo "Error: No repository URL provided with the -S flag."
  echo "Usage: $0 -S <repository_url>"
  exit 1
fi

# Clone the repository
echo "Cloning repository: $repo_url"
git clone "$repo_url" || { echo "Failed to clone repository."; exit 1; }

# Extract the repository name from the URL (last part of the URL)
repo_name=$(basename "$repo_url" .git)

# Change directory to the cloned repository
cd "$repo_name" || { echo "Failed to enter directory $repo_name"; exit 1; }

# Run makepkg as a normal user (do not use sudo here)
echo "Building the package..."
makepkg -si || { echo "Failed to build or install the package."; exit 1; }

# Clean up by removing the cloned repository
cd ..  # Go back to the previous directory
echo "Cleaning up..."
rm -rf "$repo_name"

echo "Package installed and cleaned up."

