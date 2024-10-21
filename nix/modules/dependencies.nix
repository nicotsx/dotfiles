{ pkgs, ... }:

{
  environment.systemPackages =
    [
      pkgs.oh-my-zsh
      pkgs.neovim
      pkgs.mkalias
      pkgs.tmux
      pkgs.warp-terminal
      pkgs.obsidian
      pkgs.ripgrep
      pkgs.lazygit
      pkgs.docker
      pkgs.discord
      pkgs.spotify
      pkgs.slack
      pkgs.cargo
      pkgs.nodejs_20
      pkgs.python3
      pkgs.php84Packages.composer
    ];

  homebrew = {
    enable = true;
    brews = [
      "mas"
      "stow"
      "nvm"
      "git-secrets"
    ];
    casks = [
      "the-unarchiver"
      "brave-browser"
      "hyperkey"
    ];
    masApps = {
      "Hand Mirror" = 1502839586;
      "Tailscale" = 1475387142;
      "QuickShade" = 931571202;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
