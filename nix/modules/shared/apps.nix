{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core development tools
    neovim
    tmux
    ripgrep
    lazygit
    delta
    git

    # CLI utilities
    eza
    oh-my-zsh
    zellij
    fzf
    fd
    tree
    wget
    act

    # Development languages and tools
    go
    rustup
    pyenv
    uv
    pylint
    php84Packages.composer
    pnpm

    # Container and cloud tools
    dive
    terraform
    kubernetes-helm
    k9s

    # Media and utilities
    imagemagick

    # Cross-platform GUI apps (available on both macOS and Linux)
    vscode
    discord
    spotify
    slack
    
    # Linux alternatives for macOS-specific tools
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    # Linux-specific packages
    postgresql
    gnome.nautilus
    firefox
    biome
    libmagic
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    # macOS-specific packages
    obsidian
    mkalias
    rectangle
    raycast
    signal-desktop-bin
    jetbrains.pycharm-professional
    notion-app
  ];

  environment.variables.EDITOR = "nvim";

  fonts.packages = [
    pkgs.nerd-fonts.hack
  ];
}
