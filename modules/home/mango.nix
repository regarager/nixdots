{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.mango = {
    enable = true;
    package = pkgs.mango;

    settings = {
      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "XCURSOR_SIZE,24"
        "XDG_SESSION_TYPE,wayland"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_STYLE_OVERRIDE,kvantum"
        "GDK_SCALE,2"
      ];

      monitor_rule = [
        "name:^DP-1$,width:1920,height:1080,refresh:60,x:0,y:0,scale:1"
        "name:^HDMI-A-1$"
        "name:^eDP-1$,scale:2"
      ];
      xwayland_ignore_scale = 1;

      gap_inner_horizontal = 4;
      gap_inner_vertical = 4;
      gap_outer_horizontal = 0;
      gap_outer_vertical = 0;
      border_px = 2;

      focus_color = "0x${config.lib.stylix.colors.base0B}ff";
      allow_tearing = 0;

      tag_rule = ["id:*,layout_name:tile"];
      new_is_master = 0;
      default_master_factor = 0.55;
      default_master_count = 1;
      tag_num = 9;

      border_radius = 0;
      focused_opacity = 1.0;
      unfocused_opacity = 1.0;

      blur = 1;
      blur_layer = 1;
      blur_optimized = 1;
      blur_params_radius = 3;
      blur_params_num_passes = 1;
      blur_params_noise = 0.02;
      blur_params_brightness = 0.9;
      blur_params_contrast = 0.9;
      blur_params_saturation = 1.2;

      animations = 0;
      layer_animations = 0;
      animation_type_open = "slide";
      animation_type_close = "slide";
      layer_animation_type_open = "slide";
      layer_animation_type_close = "slide";
      animation_fade_in = 1;
      animation_fade_out = 1;
      zoom_initial_ratio = 0.4;
      zoom_end_ratio = 0.8;
      fade_in_begin_opacity = 0.5;
      fade_out_begin_opacity = 0.8;
      animation_duration_move = 250;
      animation_duration_open = 250;
      animation_duration_tag = 350;
      animation_duration_close = 300;
      animation_duration_focus = 0;
      animation_curve_open = "0.0,1.25,0.15,1.0";
      animation_curve_move = "0.1,1.15,0.15,1.02";
      animation_curve_tag = "0.0,0.0,0.12,1.0";
      animation_curve_close = "0.0,0.0,0.12,1.0";
      animation_curve_focus = "0.0,0.0,0.12,1.0";
      animation_curve_opacity_fade_in = "0.0,0.0,0.12,1.0";
      animation_curve_opacity_fade_out = "0.0,0.0,0.12,1.0";
      tag_animation_direction = 1;

      window_rule = [
        "ignore_maximize:1,app_id:.*"
        "is_floating:1,width:800,height:600,app_id:xdg-desktop-portal-gtk"
        "global_key_binding:ctrl+shift-m,app_id:vesktop"
        "tags:1,app_id:vesktop"
      ];

      layer_rule = [
        "no_animation:1,layer_name:hyprpicker"
        "no_animation:1,no_blur:1,layer_name:selection"
        "no_animation:1,no_blur:1,layer_name:wayfreeze"
        "no_animation:1,no_blur:1,layer_name:msnap"
      ];

      focus_on_activate = 0;
      warp_cursor = 0;

      xkb_rules_layout = "pl";
      xkb_rules_options = "grp:alt_altgr_toggle";

      sloppy_focus = 1;

      mouse_accel_profile = 1;
      mouse_accel_speed = 0.0;
      trackpad_accel_profile = 1;

      trackpad_natural_scrolling = 0;
      trackpad_scroll_factor = 0.5;
      tap_to_click = 0;
      tap_and_drag = 0;
      drag_lock = 0;

      gesturebind = [
        "none,left,3,viewnext_have_client"
        "none,right,3,viewprev_have_client"
      ];

      bind = [
        "SUPER,t,spawn,ghostty"
        "SUPER,f,spawn,firefox"
        "SUPER,q,killclient"
        "SUPER+SHIFT,l,spawn,swaylock"
        "SUPER,e,spawn,dolphin"
        "SUPER,v,togglefloating"
        "SUPER,space,spawn_shell,pidof fuzzel || fuzzel"
        "SUPER,backspace,spawn,fuzzel-power-menu"
        "SUPER,p,togglemaximizescreen"

        "SUPER,h,focusdir,left"
        "SUPER,l,focusdir,right"
        "SUPER,k,focusdir,up"
        "SUPER,j,focusdir,down"

        "SUPER,1,view,1"
        "SUPER,2,view,2"
        "SUPER,3,view,3"
        "SUPER,4,view,4"
        "SUPER,5,view,5"
        "SUPER,6,view,6"
        "SUPER,7,view,7"
        "SUPER,8,view,8"
        "SUPER,9,view,9"
        "SUPER+SHIFT,1,tag,1"
        "SUPER+SHIFT,2,tag,2"
        "SUPER+SHIFT,3,tag,3"
        "SUPER+SHIFT,4,tag,4"
        "SUPER+SHIFT,5,tag,5"
        "SUPER+SHIFT,6,tag,6"
        "SUPER+SHIFT,7,tag,7"
        "SUPER+SHIFT,8,tag,8"
        "SUPER+SHIFT,9,tag,9"

        "SUPER,bracketright,viewtoright"
        "SUPER,bracketleft,viewtoleft"

        "SUPER+SHIFT,f,togglefullscreen"
        "SUPER+SHIFT,r,reload_config"

        "NONE,XF86MonBrightnessUp,spawn,brightnessctl set +5%"
        "NONE,XF86MonBrightnessDown,spawn,brightnessctl set 5-%"
        "NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_SINK@ .05+"
        "NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_SINK@ .05-"
        "NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SINK@ toggle"

        "ALT,Tab,switcher,all_tag_next"
        "ALT+SHIFT,Tab,switcher,all_tag_prev"
      ];

      bindr = [
        "CTRL+ALT,3,spawn,msnap shot --freeze"
        "CTRL+ALT,4,spawn,hyprpicker --autocopy --format=hex --lower"
        "CTRL+ALT,5,spawn,msnap shot --region --freeze"
      ];

      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
      ];

      tag_carousel = 1;

      exec_once = [
        "swaybg -i ~/.config/wallpaper.jpg -m fill"
        "waybar"
        "mako"
        "mpd"
        "vesktop"
        "firefox"
      ];

      overview_gap_inner = 5;
      overview_gap_outer = 30;
      hotarea_size = 10;
      enable_hotarea = 0;
      hotarea_disable_on_fullscreen = 1;
      overcircle_center_ratio = 0.5;
    };
  };

  xdg.configFile = {
    "wallpaper.jpg".source = ../../assets/wallpaper.jpg;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-wlr];
    config.common.default = "*";
  };
}
