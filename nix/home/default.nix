{ config, pkgs, lib, homeDirectory ? "/Users/nicolas", username ? "nicolas", isLinux ? false, ... }:

{
  imports = [
    (import ./user.nix { inherit config pkgs lib homeDirectory username isLinux; })
    (import ./git.nix { inherit config pkgs lib homeDirectory username isLinux; })
    (import ./programs.nix { inherit config pkgs lib homeDirectory username isLinux; })
  ];

  programs.home-manager.enable = true;
}
