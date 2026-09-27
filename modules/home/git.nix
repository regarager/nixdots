{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "/home/redger/.ssh/id_ed25519";
        addKeysToAgent = "yes";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Redger Xu";
    userEmail = "redgerxu@gmail.com";
    settings.init.defaultBranch = "master";
    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true;
        theme = "gruvbox-dark";
        features = "side-by-side";
      };
      merge.conflictStyle = "zdiff3";
      init.defaultBranch = "master";
    };
  };
}
