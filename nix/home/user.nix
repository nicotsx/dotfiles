{ config, pkgs, ... }:

{
  home = {
    username = "nicolas";
    homeDirectory = "/Users/nicolas";
    stateVersion = "24.05";
    file = {
      # ".zshrc" = {
      #   source = ~/dotfiles/zsh/.zshrc;
      # };

      ".config/tmux" = {
        enable = true;
        source = ~/dotfiles/tmux;
        onChange = ''
          if [ ! -d ~/.tmux/plugins/tpm ]; then
            nix-shell -p git --run "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
          fi
          tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH \'~/.tmux/plugins/\'
        '';
      };

      ".config/nvim-linked" = {
        source = ~/dotfiles/nvim;
        executable = true;
        # Nvim doesn't like symlinks, so we need to copy the files
        onChange = ''
          mkdir -p ~/.config/nvim
          cp -r ~/.config/nvim-linked/* ~/.config/nvim
          chmod -R 700 ~/.config/nvim
        '';
      };

      "Developer/.gitkeep" = {
        text = "";
      };
    };
  };

  programs.home-manager.enable = true;
}
