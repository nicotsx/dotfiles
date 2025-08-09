# Multi-Platform Nix Configuration

This directory contains the multi-platform Nix configuration supporting both macOS (Darwin) and Ubuntu/Linux systems.

## Architecture

The configuration is organized into platform-specific and shared modules:

- **`flake.nix`**: Main entry point defining configurations for both Darwin and NixOS
- **`modules/shared/`**: Cross-platform configuration
- **`modules/darwin/`**: macOS-specific configuration
- **`modules/linux/`**: Linux/NixOS-specific configuration
- **`home/`**: Home Manager configurations with platform detection

## Configurations Available

### Darwin (macOS)

```bash
darwin-rebuild switch --flake .#developer
```

### NixOS (Linux)

```bash
sudo nixos-rebuild switch --flake .#developer
```

### Home Manager Standalone (Ubuntu)

```bash
home-manager switch --flake .#nicolas
```

## Installation

Use the `../apply.sh` script which auto-detects your platform, or refer to the main README for detailed setup instructions.

## Cheatsheet

### Update packages

```bash
nix flake update
```

### Search for a package

#### Nixpkgs

```bash
nix search nixpkgs <package>
```

#### Homebrew Mac App Store (macOS only)

```bash
mas search <package>
```

This command will search for a package in the Mac App Store and return the ID of the package.
It can then be added in the `masApps` section of the Darwin apps configuration.

```nix
masApps = {
  "Tailscale" = "1475387142";
};
```

### Apply configuration

#### macOS

```bash
darwin-rebuild switch --flake .#developer
```

#### Linux/Ubuntu

```bash
# Full NixOS system
sudo nixos-rebuild switch --flake .#developer

# Home Manager only (Ubuntu)
home-manager switch --flake .#nicolas
```

## Key Features

- **Platform Detection**: Automatically applies correct configuration based on system
- **Shared Package Management**: Common development tools across all platforms
- **Platform-Specific Optimizations**: macOS system defaults, Linux desktop environment
- **Unified Dotfiles**: Same configuration files work on both platforms
- **Homebrew Integration**: macOS-specific package management alongside Nix
