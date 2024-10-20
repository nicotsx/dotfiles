{ config, pkgs, ... }:

{
  home.username = "nicolas";
  home.homeDirectory = "/Users/nicolas";
  home.stateVersion = "24.05";

  home.file = {
    ".zshrc".source = ~/dotfiles/zsh/.zshrc;

    ".config/tmux".source = ~/dotfiles/tmux;
    ".config/nvim".source = ~/dotfiles/nvim;
  };



  programs.home-manager.enable = true;
}
