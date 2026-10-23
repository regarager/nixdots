{pkgs, lib, ...}: {
  # Stylix's GTK target assigns the `adw-gtk3` theme, so force the
  # Gruvbox-Dark theme here. Stylix still appends its Gruvbox palette to
  # gtk.css (and flatpaks), so application colors stay consistent.
  gtk.theme = lib.mkForce {
    name = "Gruvbox-Dark";
    package = pkgs.gruvbox-gtk-theme;
  };

  gtk.iconTheme = {
    name = "Gruvbox-Plus-Dark";
    package = pkgs.gruvbox-plus-icons;
  };
}
