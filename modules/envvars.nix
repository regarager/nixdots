{...}: {
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_THEME = "Gruvbox-Dark";
    QT_QPA_PLATFORMTHEME = "gtk3"; # Qt apps follow GTK portal/theme
  };
}
