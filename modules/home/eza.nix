{pkgs, ...}: {
  programs.eza.enable = true;

  xdg.configFile."eza/theme.yml".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/eza-community/eza-themes/21184b5/themes/gruvbox-dark.yml";
    hash = "sha256-6vxzSQw2mq8oh0Es1LYmbbavuN0LFOg4Ch6u1G9dv4w=";
  };
}
