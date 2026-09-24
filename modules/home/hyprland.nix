{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraConfig = builtins.readFile ../hypr/hyprland.lua;

    extraLuaFiles = {
      "conf/env.lua" = ../hypr/conf/env.lua;
      "conf/input.lua" = ../hypr/conf/input.lua;
      "conf/programs.lua" = ../hypr/conf/programs.lua;
      "conf/monitors.lua" = ../hypr/conf/monitors.lua;
      "conf/appearance.lua" = ../hypr/conf/appearance.lua;
      "conf/keybinds.lua" = ../hypr/conf/keybinds.lua;
      "conf/plugins.lua" = ../hypr/conf/plugins.lua;
      "conf/autostart.lua" = ../hypr/conf/autostart.lua;
    };
  };

  xdg.configFile = {
    "hypr/hypridle.conf".source = ../hypr/hypridle.conf;
    "hypr/hyprlock.conf".source = ../hypr/hyprlock.conf;
    "hypr/hyprpaper.conf".source = ../hypr/hyprpaper.conf;
    "hypr/user.png".source = ../../assets/user.png;
    "wallpaper.jpg".source = ../../assets/wallpaper.jpg;
  };
}
