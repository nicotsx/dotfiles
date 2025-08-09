{ ... }:

{
  imports = [
    ./user.nix
    ./git.nix
    ./programs.nix
  ];

  programs.home-manager.enable = true;
}
