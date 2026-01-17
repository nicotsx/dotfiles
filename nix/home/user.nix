{ config, pkgs, lib, ... }:

{
  home = {
    username = "nicolas";
    homeDirectory = "/Users/nicolas";
    stateVersion = "24.05";
    activation.mySymlinks = lib.mkAfter ''
      ln -snf /Users/nicolas/dotfiles/nvim /Users/nicolas/.config/nvim
      ln -snf /Users/nicolas/dotfiles/zellij /Users/nicolas/.config/zellij
      ln -snf /Users/nicolas/dotfiles/lazygit /Users/nicolas/.config/lazygit
      ln -snf /Users/nicolas/dotfiles/ghostty /Users/nicolas/.config/ghostty
      ln -snf /Users/nicolas/dotfiles/karabiner /Users/nicolas/.config/karabiner
      ln -snf /Users/nicolas/dotfiles/zsh/.zshrc /Users/nicolas/.zshrc
      ln -snf /Users/nicolas/dotfiles/opencode /Users/nicolas/.config/opencode
    '';
    file = {
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
