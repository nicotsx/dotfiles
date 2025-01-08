{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation {
  name = "docker-desktop";
  src = pkgs.fetchurl {
    url = "https://desktop.docker.com/mac/main/arm64/178610/Docker.dmg";
    sha256 = "sha256-Rx96W9Z4dUV6SA7cPVI0Y1odO3w7FY/apSDIhyPjJxI=";
  };
  nativeBuildInputs = with pkgs; [ fd _7zz ];
  unpackPhase = ''
    7zz x $src || true
  '';
  installPhase = ''
    mkdir -p $out/Applications
    echo "Copying Docker Desktop to Applications"
    export APP_PATH=$(fd -t d ".app" -1)
    cp -a "$APP_PATH" $out/Applications
  '';
}
