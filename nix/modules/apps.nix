{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    eza
    oh-my-zsh
    neovim
    mkalias
    tmux
    obsidian
    ripgrep
    lazygit
    discord
    spotify
    slack
    python314Full
    pyright
    php84Packages.composer
    pnpm
    raycast
    vscode
    signal-desktop-bin
    rustup
    dive
    rectangle
    terraform
    delta
    go
    #postman
    jetbrains.pycharm-professional
  ];
  environment.variables.EDITOR = "nvim";

  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "macos-fuse-t/homebrew-cask"
    ];

    brews = [
      "mas"
      "stow"
      "nvm"
      "git-secrets"
      "ccat"
      "tree"
      "fd"
      "fzf"
      "wget"
      "act"
    ];

    casks = [
      "the-unarchiver"
      "brave-browser"
      "hyperkey"
      "db-browser-for-sqlite"
      "legcord"
      "ghostty"
      "fuse-t"
      "fuse-t-sshfs"
      "vlc"
    ];

    masApps = {
      "Hand Mirror" = 1502839586;
      "Tailscale" = 1475387142;
      "QuickShade" = 931571202;
      "Xcode" = 497799835;
      "AutoMounter" = 1160435653;
      "DaisyDisk" = 411643860;
    };
  };

  fonts.packages = [
    pkgs.nerd-fonts.hack
  ];

  zip7.enable = true;
  docker-desktop.enable = false;
}
