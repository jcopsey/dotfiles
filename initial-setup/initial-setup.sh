#!/bin/bash

set -e  # Exit on error

echo "Installing Homebrew..."
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for this script
    if [[ $(uname -m) == 'arm64' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed"
fi

echo "Installing Ghostty..."
brew install --cask ghostty

echo "Installing Starship..."
brew install starship

echo "Installing Vim..."
brew install vim

echo "Installing Neovim"
brew install neovim

echo "Installing Git..."
brew install git

echo "Installing Zsh Syntax Highlighting and Autosuggestions..."
brew install zsh-syntax-highlighting zsh-autosuggestions

echo "Copying configuration files..."
cp initial-setup/.zshrc ~/.zshrc
cp initial-setup/.zprofile ~/.zprofile
mkdir -p ~/.config/starship && cp initial-setup/starship/starship.toml ~/.config/starship/starship.toml
mkdir -p ~/.config/ghostty && cp initial-setup/ghostty/config ~/.config/ghostty/config
echo "Configuration files copied to home directory"

echo "Fixing zsh history ownership..."
if [ -f ~/.zsh_history ]; then
    sudo chown $USER:staff ~/.zsh_history
    echo "zsh history ownership updated"
else
    echo "No zsh history file found (will be created on first use)"
fi

# Install LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git