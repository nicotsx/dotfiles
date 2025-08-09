#!/bin/bash

# Ubuntu setup script for Nix + dotfiles

set -e

echo "🚀 Setting up Nix environment on Ubuntu..."

# Install Nix if not already installed
if ! command -v nix &> /dev/null; then
    echo "📦 Installing Nix..."
    curl -L https://nixos.org/nix/install | sh -s -- --daemon
    
    # Source nix environment
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
else
    echo "✅ Nix is already installed"
fi

# Enable nix flakes
echo "⚙️ Configuring Nix with flakes support..."
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# Clone dotfiles if not already present
if [ ! -d "$HOME/dotfiles" ]; then
    echo "📁 Cloning dotfiles..."
    git clone https://github.com/yourusername/dotfiles.git "$HOME/dotfiles"
else
    echo "✅ Dotfiles already present"
fi

# Apply Home Manager configuration
echo "🏠 Setting up Home Manager..."
cd "$HOME/dotfiles"

# Install and apply Home Manager
nix run home-manager/master -- switch --flake ./nix#nicolas

echo "🎉 Setup complete! Your Ubuntu environment is now configured with Nix and dotfiles."
echo ""
echo "📝 Next steps:"
echo "  1. Restart your terminal or run: source ~/.bashrc"
echo "  2. To update your configuration later, run: ./apply.sh"
