{config, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = [
          "tray"
          "hyprland/language"
          "pulseaudio"
          "temperature"
          "cpu"
          "battery"
          "network"
        ];

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "  {volume}%";
          on-click = "wpctl set-sink-mute @DEFAULT_SINK@ toggle";
          scroll-step = 0;
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
        };
        network = {
          format-wifi = "{ifname}";
          tooltip-format-wifi = "{essid}";
        };
        temperature = {
          format = " {temperatureC}°C";
          format-critical = " {temperatureC}°C";
          critical-threshold = 80;
          interval = 2;
          tooltip = false;
        };
        battery = {
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          tooltip-format = "{time} - {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          interval = 5;
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        clock = {
          format = "{:%H:%M %Y-%m-%d}";
          tooltip = false;
        };
        cpu = {
          interval = 5;
          format = " {usage}%";
          max-length = 10;
        };
        memory = {
          interval = 5;
          format = " {}%";
          max-length = 10;
        };
        "hyprland/language" = {
          format = "{shortDescription}";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: "Maple Mono NF";
        font-size: 14px;
        color: ${config.lib.stylix.colors.withHashtag.base07};
      }

      window#waybar {
        background-color: transparent;
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial;
        min-width: 0;
        padding: 0px 12px;
        border-top: 2px solid transparent;
        border-bottom: 2px solid transparent;
      }

      #workspaces button.active {
        border-bottom: 2px solid ${config.lib.stylix.colors.withHashtag.base07};
      }

      #workspaces button:hover {
        font-weight: 900;
      }

      #workspaces button.urgent {
        font-weight: 900;
        color: #ee5396;
      }

      #backlight,
      #battery,
      #clock,
      #cpu,
      #custom-power,
      #language,
      #memory,
      #network,
      #pulseaudio,
      #temperature,
      #tray {
        margin: 0px 8px;
        padding: 0px 0px;
      }

      #battery.charging,
      #battery.plugged,
      #battery.warning {
        background-color: inherit;
      }

      tooltip {
        background: ${config.lib.stylix.colors.withHashtag.base01};
      }

      .modules-left, .modules-right {
        margin-left: 16px;
        margin-right: 16px;
      }

      .modules-left, .modules-right, .modules-center {
        margin-top: 8px;
      }
    '';
  };
}
