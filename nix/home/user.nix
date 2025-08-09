{ config, pkgs, lib, homeDirectory ? "/Users/nicolas", username ? "nicolas", isLinux ? false, ... }:

{
  home = {
    username = username;
    homeDirectory = homeDirectory;
    stateVersion = "24.05";
    activation.mySymlinks = lib.mkAfter ''
      ln -sf ${homeDirectory}/dotfiles/nvim ${homeDirectory}/.config/nvim
      ln -sf ${homeDirectory}/dotfiles/zellij ${homeDirectory}/.config/zellij
      ln -sf ${homeDirectory}/dotfiles/lazygit ${homeDirectory}/.config/lazygit
      ln -sf ${homeDirectory}/dotfiles/ghostty ${homeDirectory}/.config/ghostty
      ln -sf ${homeDirectory}/dotfiles/karabiner ${homeDirectory}/.config/karabiner
    '';
    file = {
      "Developer/.gitkeep" = {
        text = "";
      };
    };

    # Generate SSH key if it doesn't exist
    activation.generateSSHKey = lib.mkAfter ''
      if [ ! -f ${homeDirectory}/.ssh/id_ed25519 ]; then
        nix-shell -p openssh --run "ssh-keygen -t ed25519 -C \"github@thisprops.com\" -f ${homeDirectory}/.ssh/id_ed25519 -N \"\" || true"
      fi
    '';
  };

  programs.home-manager.enable = true;
}
