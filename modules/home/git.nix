{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Redger Xu";
        email = "redgerxu@gmail.com";
      };
      init.defaultBranch = "master";
    };
  };
}
