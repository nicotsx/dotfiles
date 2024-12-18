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
        source = ~/dotfiles/tmux;
        onChange = ''
          mkdir -p ~/.config/tmux
          cp -r ~/.config/tmux-linked/* ~/.config/tmux
          chmod -R 700 ~/.config/tmux

          if [ ! -d ~/.tmux/plugins/tpm ]; then
            nix-shell -p git --run "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
          fi
        '';
      };

      ".config/nvim-source" = {
        source = ~/dotfiles/nvim;
        recursive = true;
        force = true;
        # Nvim doesn't like symlinks, so we need to copy the files
        onChange = ''
          mkdir -p ~/.config/nvim
          cp -r ~/.config/nvim-source/* ~/.config/nvim
          chmod -R 700 ~/.config/nvim
        '';
      };

      "Developer/.gitkeep" = {
        text = "";
      };
    };

    # Generate SSH key if it doesn't exist
    activation.generateSSHKey = lib.mkAfter ''
      if [ ! -f ~/.ssh/id_ed25519 ]; then
        nix-shell -p openssh --run "ssh-keygen -t ed25519 -C \"github@thisprops.com\" -f ~/.ssh/id_ed25519 -N \"\" || true"
      fi
    '';
  };

  programs.home-manager.enable = true;
}
