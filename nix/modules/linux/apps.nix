{ pkgs, ... }:

{
  imports = [
    ../shared/apps.nix
  ];

  # Additional Linux-specific packages and services
  environment.systemPackages = with pkgs; [
    # Linux desktop applications
    firefox
    thunderbird
    libreoffice
    gimp
    
    # Linux system tools
    htop
    neofetch
    curl
    unzip
    gparted
    
    # Development tools commonly needed on Linux
    gcc
    cmake
    pkg-config
    
    # Terminal emulators (alternatives to macOS apps)
    alacritty
    kitty
    
    # File managers
    ranger
    
    # Linux-specific utilities
    xclip
    wmctrl
    
    # GNOME-specific tools
    gnome.gnome-tweaks
    gnome-extension-manager
    dconf-editor
  ];

  # Enable Flatpak (popular on Ubuntu/Linux)
  services.flatpak.enable = true;
}
