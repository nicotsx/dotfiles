#!/bin/bash

# Multi-platform Nix configuration apply script

PLATFORM=""
CONFIG=""

# Detect platform
if [[ "$OSTYPE" == "darwin"* ]]; then
  PLATFORM="darwin"
  CONFIG="developer"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  PLATFORM="linux"
  CONFIG="developer"
else
  echo "Unsupported platform: $OSTYPE"
  exit 1
fi

echo "Detected platform: $PLATFORM"

# Change to the directory containing this script
cd "$(dirname "$0")" || exit 1

case $PLATFORM in
"darwin")
  echo "Applying macOS (Darwin) configuration..."
  darwin-rebuild switch --flake ./nix#$CONFIG --impure
  ;;
"linux")
  echo "Applying NixOS system configuration..."
  sudo nixos-rebuild switch --flake ./nix#$CONFIG
  ;;
esac

echo "Configuration applied successfully!"
