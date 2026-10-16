{lib, ...}: {
  home.activation.createDefaultDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    run mkdir -p "$HOME/Projects" "$HOME/Videos" "$HOME/Pictures/Screenshots" "$HOME/Notes"
  '';

  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };
}
