{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    eza
    oh-my-zsh
    neovim
    mkalias
    obsidian
    ripgrep
    lazygit
    discord
    pyenv
    uv
    pylint
    pnpm
    raycast
    vscode
    signal-desktop-bin
    rustup
    dive
    rectangle
    delta
    go
    notion-app
    kubernetes-helm
    k9s
    zellij
    lua54Packages.luarocks
    netbird
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
      "hashicorp/tap"
      "mutagen-io/mutagen"
      "anomalyco/tap"
      # "tw93/tap"
    ];

    brews = [
      "mole"
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
      "imagemagick"
      "libmagic"
      "biome"
      "postgresql"
      "coreutils"
      "libpng"
      "pkg-config"
      "packer"
      "mutagen"
      "kubectl"
      "pipx"
      "maven"
      "swagger-codegen"
      "anomalyco/tap/opencode"
      "restic"
      "watchman"
      "cocoapods"
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
      "cryptomator"
      "ngrok"
      "spotify"
      "zulu@17"
    ];

    masApps = {
      "Hand Mirror" = 1502839586;
      "Tailscale" = 1475387142;
      "QuickShade" = 931571202;
      "Xcode" = 497799835;
      "AutoMounter" = 1160435653;
      "DaisyDisk" = 411643860;
      "Slack" = 803453959;
    };
  };

  fonts.packages = [
    pkgs.nerd-fonts.hack
  ];

  zip7.enable = true;
  docker-desktop.enable = false;
}
