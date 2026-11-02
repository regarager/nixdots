{
  pkgs,
  lib,
  ...
}: {
  gtk.theme = lib.mkForce {
    name = "Gruvbox-Dark-Medium";
    package = pkgs.gruvbox-gtk-theme.override {
      colorVariants = ["dark"];
      themeVariants = ["default"];
      tweakVariants = ["medium"];
    };
  };

  gtk.iconTheme = {
    name = "Gruvbox-Plus-Dark";
    package = pkgs.gruvbox-plus-icons;
  };
}
