{ pkgs, ... }:

{
  imports = [
    ../shared/apps.nix
  ];

  # macOS-specific system packages (in addition to shared ones)
  environment.systemPackages = with pkgs; [
    # macOS-specific utilities
    mkalias
  ];

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
      "imagemagick"
      "libmagic"
      "spotify_player"
      "biome"
      "postgresql"
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

  zip7.enable = true;
}
