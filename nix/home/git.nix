{ lib, ... }:

{
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f /Users/nicolas/.gitconfig
  '';

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Nicolas Meienberger";
    userEmail = "github@thisprops.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };

    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };
  };
}
