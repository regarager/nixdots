{...}: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true; # 👈 this is what replaces the eval
    options = ["--cmd cd"]; # optional: makes `cd` use zoxide
  };
}
