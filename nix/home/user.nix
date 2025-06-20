{ config, pkgs, lib, ... }:

{
  home = {
    username = "nicolas";
    homeDirectory = "/Users/nicolas";
    stateVersion = "24.05";
    file = {
      # ".zshrc" = {
      #   source = ~/dotfiles/zsh/.zshrc;
      # };

      ".config/tmux-linked" = {
        enable = true;
        source = /Users/nicolas/dotfiles/tmux;
        onChange = ''
          mkdir -p /Users/nicolas/.config/tmux
          cp -r /Users/nicolas/.config/tmux-linked/* /Users/nicolas/.config/tmux
          chmod -R 700 /Users/nicolas/.config/tmux

          if [ ! -d /Users/nicolas/.tmux/plugins/tpm ]; then
            nix-shell -p git --run "git clone https://github.com/tmux-plugins/tpm /Users/nicolas/.tmux/plugins/tpm"
          fi
        '';
      };

      ".config/nvim-source" = {
        source = /Users/nicolas/dotfiles/nvim;
        recursive = true;
        force = true;
        # Nvim doesn't like symlinks, so we need to copy the files
        onChange = ''
          mkdir -p /Users/nicolas/.config/nvim
          cp -r /Users/nicolas/.config/nvim-source/* /Users/nicolas/.config/nvim
          chmod -R 700 /Users/nicolas/.config/nvim
        '';
      };

      ".config/lazygit" = {
        source = /Users/nicolas/dotfiles/lazygit;
      };

      ".config/ghostty" = {
        source = /Users/nicolas/dotfiles/ghostty;
      };

      "Developer/.gitkeep" = {
        text = "";
      };
    };

    # Generate SSH key if it doesn't exist
    activation.generateSSHKey = lib.mkAfter ''
      if [ ! -f /Users/nicolas/.ssh/id_ed25519 ]; then
        nix-shell -p openssh --run "ssh-keygen -t ed25519 -C \"github@thisprops.com\" -f /Users/nicolas/.ssh/id_ed25519 -N \"\" || true"
      fi
    '';
  };

  programs.home-manager.enable = true;
}
