{ ... }:

{
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
      };

      initContent = ''
        export XDG_CONFIG_HOME="$HOME/.config"
        export DISABLE_AUTO_UPDATE=true

        export PATH="/opt/homebrew/bin:$PATH"
        export PATH="/run/current-system/sw/bin:$PATH"

        export TMUX_PLUGIN_MANAGER_PATH="~/.tmux/plugins"
        export PNPM_HOME="/Users/$USER/Library/pnpm"

        export PATH="$PATH:$PNPM_HOME"

        export PATH="/Users/$USER/.deno/bin:$PATH"
        export PATH="/Users/$USER/.bun/bin:$PATH"

        export NVM_DIR="$HOME/.config/nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

        source $HOME/.local/bin/env
      '';

      shellAliases = {
        "ls" = "eza -la";
        "cat" = "ccat";
        "gemini" = "npx https://github.com/google-gemini/gemini-cli";
      };
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
