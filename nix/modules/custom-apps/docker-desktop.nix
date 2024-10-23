{ config, pkgs, lib, ... }:

let
  dockerDesktop = pkgs.callPackage ../../pkgs/docker-desktop.nix {};
in
{
  options.docker-desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Docker Desktop.";
  };

  config = lib.mkIf config.docker-desktop.enable {
    environment.systemPackages = [ dockerDesktop ];
  };
}
