{ lib, pkgs, ... }:

{
  imports = [
    ./docker-desktop.nix
    ./7zz.nix
  ];
}
