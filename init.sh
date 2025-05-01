#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed successfully!"
else
    echo "Homebrew already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Python (latest version)
echo "Installing Python..."
brew install python

# Verify Python and pip installations
echo "Checking Python and pip versions..."
python3 --version
pip3 --version

# Install applications using Homebrew Cask
echo "Installing applications..."

brew install --cask brave-browser
brew install --cask pycharm-ce           # For PyCharm Community Edition
# If you want PyCharm Professional instead, comment above and uncomment below
# brew install --cask pycharm

brew install --cask visual-studio-code
brew install --cask dbeaver-community
brew install --cask github                # GitHub Desktop
brew install --cask zoom
brew install --cask dbvisualizer

# List installed casks
echo "Installed GUI applications:"
brew list --cask

echo "✅ All applications and Python installed successfully!"
