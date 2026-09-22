{...}:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "/home/redger/.ssh/id_ed25519"; # <-- CHANGE THIS
        addKeysToAgent = "yes";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Redger Xu";         # <-- CHANGE THIS
    userEmail = "redgerxu@gmail.com"; # <-- CHANGE THIS

    settings.init.defaultBranch = "master";
  };
}
