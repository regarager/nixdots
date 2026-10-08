{pkgs, ...}: {
  # MangoWC session, mirroring modules/home/hyprland.nix.
  # The compositor itself is enabled system-wide in configuration.nix via
  # programs.mango.enable (session entry, xdg portals, polkit).
  xdg.configFile = {
    "mango/config.conf".source = ../mango/config.conf;
    "hypr/hypridle.conf".source = ../hypr/hypridle.conf;
    "hypr/hyprlock.conf".source = ../hypr/hyprlock.conf;
    "hypr/user.png".source = ../../assets/user.png;
    "wallpaper.jpg".source = ../../assets/wallpaper.jpg;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-wlr];
  };
}
