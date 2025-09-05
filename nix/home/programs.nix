{ ... }:

{
  programs = {
    zsh = {
      enable = false;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };

    ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/id_ed25519

        Host benevity
          HostName github.com
          User git
          IdentityFile ~/.ssh/benevity
          IdentitiesOnly yes
          UseKeychain yes
          AddKeysToAgent yes
      '';
    };
  };
}
