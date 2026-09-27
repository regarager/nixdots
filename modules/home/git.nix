{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false; 
    settings = {
      "github.com" = {
        user = "git";
        identityFile = "/home/redger/.ssh/id_ed25519";
        addKeysToAgent = "yes";
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Redger Xu";
        email = "redgerxu@gmail.com";
      };
      init.defaultBranch = "master";
      merge.conflictStyle = "zdiff3";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      theme = "gruvbox-dark";
      features = "side-by-side";
    };
  };
}
