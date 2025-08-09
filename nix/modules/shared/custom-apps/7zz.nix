{ config, pkgs, lib, ... }:

let
  zip7 = pkgs.callPackage ../../../pkgs/7zz.nix {};
in
{
  options.zip7.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable 7-Zip";
  };

  config = lib.mkIf config.zip7.enable {
    environment.systemPackages = [ zip7 ];
  };
}
