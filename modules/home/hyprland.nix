{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraConfig = "";
  };

  xdg.configFile = {
    # Entry point
    "hypr/hyprland.lua".source = ../hypr/hyprland.lua;

    # Config modules
    "hypr/conf/env.lua".source = ../hypr/conf/env.lua;
    "hypr/conf/input.lua".source = ../hypr/conf/input.lua;
    "hypr/conf/programs.lua".source = ../hypr/conf/programs.lua;
    "hypr/conf/monitors.lua".source = ../hypr/conf/monitors.lua;
    "hypr/conf/appearance.lua".source = ../hypr/conf/appearance.lua;
    "hypr/conf/keybinds.lua".source = ../hypr/conf/keybinds.lua;
    "hypr/conf/plugins.lua".source = ../hypr/conf/plugins.lua;
    "hypr/conf/autostart.lua".source = ../hypr/conf/autostart.lua;

    # Companion configs
    "hypr/hypridle.conf".source = ../hypr/hypridle.conf;
    "hypr/hyprlock.conf".source = ../hypr/hyprlock.conf;
    "hypr/hyprpaper.conf".source = ../hypr/hyprpaper.conf;
    "hypr/user.png".source = ../../assets/user.png;
    "wallpaper.jpg".source = ../../assets/wallpaper.jpg;
  };
}
