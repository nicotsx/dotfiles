{ lib, ... }:

{
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f /Users/nicolas/.gitconfig
  '';

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      features = "side-by-side";
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user.name = "Nicolas Meienberger";
      user.email = "github@thisprops.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
