{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    eza
    oh-my-zsh
    neovim
    mkalias
    tmux
    warp-terminal
    obsidian
    ripgrep
    lazygit
    docker
    discord
    spotify
    slack
    nodejs
    python3
    php84Packages.composer
    pnpm
    raycast
    vscode
    signal-desktop
    rustup
    dive
    rectangle
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
      "homebrew/services"
    ];

    brews = [
      "mas"
      "stow"
      "nvm"
      "git-secrets"
      "ccat"
      "tree"
    ];

    casks = [
      "the-unarchiver"
      "brave-browser"
      "hyperkey"
      "db-browser-for-sqlite"
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
    (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  zip7.enable = true;
  docker-desktop.enable = true;
}
