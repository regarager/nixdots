{...}: {
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "waterfox.desktop";
    "x-scheme-handler/http" = "waterfox.desktop";
    "x-scheme-handler/https" = "waterfox.desktop";
    "x-scheme-handler/about" = "waterfox.desktop";
    "x-scheme-handler/unknown" = "waterfox.desktop";
  };
}
