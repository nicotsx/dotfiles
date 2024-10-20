# Nix Darwin configuration

## Installation

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

#### Homebrew Mac App Store

```bash
mas search <package>
```

This command will search for a package in the Mac App Store and return the ID of the package.
It can then be added in the `masApps` section of the `flake.nix` file.

```nix
masApps = {
  "Tailscale" = "1475387142";
};
```

### Apply configuration

```bash
darwin-rebuild switch --flake ~/.config/nix#developer
```
