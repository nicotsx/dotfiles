# How to use

1. Install the Nix package manager

```bash
$ sh <(curl -L https://nixos.org/nix/install)
```

2. Clone this repo in the home folder

```
~/dotfiles
```

2. Install system

```bash
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/dotfiles/.config/nix#developer
```

2. Re-apply config 

```bash
darwin-rebuild switch --flake ~/dotfiles/.config/nix#developer
```
