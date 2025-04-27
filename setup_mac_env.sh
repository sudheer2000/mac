#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting setup..."

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update brew
brew update

# Install essential packages
brew install git
brew install python
brew install tmux
brew install neofetch
brew install tree
brew install docker colima
brew install mysql
brew install node
brew install --cask iterm2
brew install --cask dbeaver-community
brew install --cask sequel-ace
brew install --cask docker
brew install metabase

# Start services
brew services start mysql
colima start --runtime docker

# Install fonts for terminal
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Install Oh-My-Zsh and Powerlevel10k theme
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
  source ~/.zshrc
fi

# Python pip packages
pip install --upgrade pip
pip install fastapi uvicorn sqlalchemy passlib[bcrypt] python-jose mysqlclient python-dotenv pymysql pandas mysql-connector-python

# Node.js setup (already installed via brew install node)
node -v
npm -v
npx -v

# Setup completed
echo "Setup completed successfully!"
