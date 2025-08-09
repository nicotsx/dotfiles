# Multi-Platform Dotfiles Configuration

A comprehensive Nix-based dotfiles setup that works on both macOS (Darwin) and Ubuntu/Linux systems.

## 🚀 Quick Start

### macOS (Darwin) Setup

1. Install the Nix package manager:

```bash
sh <(curl -L https://nixos.org/nix/install)
```

2. Clone this repo to your home folder:

```bash
git clone <your-repo> ~/dotfiles
```

3. Install the system configuration:

```bash
cd ~/dotfiles
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake './nix#developer'
```

4. For subsequent updates, use:

```bash
./apply.sh
```

### Ubuntu/Linux Setup

For Ubuntu systems, you have two options:

#### Option 1: Home Manager Only (Recommended for Ubuntu)

Run the automated setup script:

```bash
curl -L https://raw.githubusercontent.com/yourusername/dotfiles/main/ubuntu-setup.sh | bash
```

Or manually:

```bash
# Install Nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon

# Clone dotfiles
git clone <your-repo> ~/dotfiles
cd ~/dotfiles

# Apply Home Manager configuration
nix run home-manager/master -- switch --flake ./nix#nicolas
```

#### Option 2: Full NixOS System (Advanced)

If you're running NixOS, you can use the full system configuration:

```bash
sudo nixos-rebuild switch --flake ./nix#developer
```

## 📁 Project Structure

```
nix/
├── flake.nix                 # Main flake configuration (multi-platform)
├── modules/
│   ├── shared/              # Shared configuration between platforms
│   │   ├── apps.nix         # Cross-platform applications
│   │   ├── nix-core.nix     # Core Nix settings
│   │   └── custom-apps/     # Custom app definitions
│   ├── darwin/              # macOS-specific configuration
│   │   ├── system.nix       # macOS system settings (dock, finder, etc.)
│   │   └── apps.nix         # macOS-specific apps + homebrew
│   └── linux/               # Linux-specific configuration
│       ├── configuration.nix # NixOS system configuration
│       └── apps.nix         # Linux-specific applications
└── home/                    # Home Manager configurations
    ├── default.nix          # Main home config with platform detection
    ├── darwin.nix           # macOS-specific home settings
    ├── linux.nix            # Linux-specific home settings
    ├── standalone.nix       # Standalone Home Manager (for Ubuntu)
    ├── git.nix              # Git configuration
    ├── programs.nix         # Program-specific configs
    └── user.nix             # User settings
```

## 🔧 What's Shared vs Platform-Specific

### ✅ Shared Between Platforms

- **Development tools**: neovim, tmux, git, ripgrep, lazygit, etc.
- **CLI utilities**: eza, zellij, fzf, tree, etc.
- **Programming languages**: Go, Rust, Python, Node.js, PHP
- **Container tools**: Docker, Kubernetes tools (k9s, helm)
- **Dotfiles symlinks**: nvim, zellij, lazygit, ghostty configs
- **Home Manager configuration**: Most settings work across platforms

### 🍎 macOS-Specific

- **nix-darwin**: System management for macOS
- **Homebrew**: Package management and casks
- **System defaults**: Dock, Finder, NSGlobalDomain settings
- **Mac App Store**: Apps installed via `mas`
- **macOS apps**: Rectangle, Raycast, Obsidian, etc.
- **Application linking**: Apps linked to `/Applications`

### 🐧 Linux-Specific

- **System services**: PostgreSQL, Docker, NetworkManager
- **Desktop environment**: GNOME, X11 configuration
- **Linux package alternatives**: Firefox instead of Safari, etc.
- **System tools**: GNOME utilities, system administration tools
- **Package management**: APT packages can still be used alongside Nix

## 🔄 Updating Configuration

After making changes to your configuration:

1. **macOS**: Run `./apply.sh` (will auto-detect and use darwin-rebuild)
2. **Ubuntu/Linux**: Run `./apply.sh` (will prompt for NixOS vs Home Manager)

## 🛠 Customization

### Adding New Applications

1. **Cross-platform apps**: Add to `modules/shared/apps.nix`
2. **macOS-only apps**: Add to `modules/darwin/apps.nix` or homebrew section
3. **Linux-only apps**: Add to `modules/linux/apps.nix`

### Modifying System Settings

1. **macOS settings**: Edit `modules/darwin/system.nix`
2. **Linux settings**: Edit `modules/linux/configuration.nix`
3. **Shared settings**: Edit `modules/shared/nix-core.nix`

### Home Manager Settings

- **Platform-specific home settings**: Edit `home/darwin.nix` or `home/linux.nix`
- **Shared home settings**: Edit `home/git.nix`, `home/programs.nix`, etc.

## 🚨 Troubleshooting

### Common Issues

1. **Flakes not enabled**: Ensure experimental features are enabled in your Nix config
2. **Permission issues on Linux**: Some operations may require `sudo`
3. **Home Manager conflicts**: Remove existing dotfiles that conflict with symlinks
4. **macOS Homebrew issues**: Try `brew doctor` and resolve any issues

### Getting Help

- Check the Nix manual: https://nixos.org/manual/nix/stable/
- Home Manager manual: https://nix-community.github.io/home-manager/
- nix-darwin documentation: https://github.com/LnL7/nix-darwin
