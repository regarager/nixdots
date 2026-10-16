{
  pkgs,
  config,
  ...
}: let
  fuzzel-power-menu = pkgs.writeShellApplication {
    name = "fuzzel-power-menu";
    runtimeInputs = [
      config.programs.fuzzel.package
      pkgs.swaylock
      pkgs.systemd
    ];
    text = ''
      choices=$'Lock\t\uf023  Lock'
      choices+=$'\nLog out\t\uf08b  Log out'
      choices+=$'\nSuspend\t\uf4b2  Suspend'
      choices+=$'\nReboot\t\uf021  Reboot'
      choices+=$'\nShut down\t\uf011  Shut down'

      sel=$(printf '%s\n' "$choices" | cut -f2 | fuzzel --dmenu -p '> ' --lines 5 --width 32 || true)
      [ -z "$sel" ] && exit 0

      key=$(printf '%s\n' "$choices" | while IFS=$'\t' read -r k v; do
        if [ "$v" = "$sel" ]; then printf '%s\n' "$k"; fi
      done)

      case "$key" in
        Lock) swaylock ;;
        "Log out") loginctl terminate-user "$USER" ;;
        Suspend) systemctl suspend ;;
        Reboot) systemctl reboot ;;
        "Shut down") systemctl poweroff ;;
      esac
    '';
  };
in {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Maple Mono NF:size=12";
        prompt = "\"> \""; # otherwise the space is not properly inserted
        icons-enabled = true;
        icon-theme = "Gruvbox-Plus-Dark";
        width = 48;
        line-height = 32;
        lines = 5;
        horizontal-pad = 16;
        vertical-pad = 8;
        inner-pad = 8;
      };

      colors = {
        background = "${config.lib.stylix.colors.base00}ff";
        text = "${config.lib.stylix.colors.base06}ff";
        prompt = "${config.lib.stylix.colors.base04}ff";
        input = "${config.lib.stylix.colors.base06}ff";
        match = "${config.lib.stylix.colors.base0B}ff";
        selection = "${config.lib.stylix.colors.base02}ff";
        selection-text = "${config.lib.stylix.colors.base07}ff";
        selection-match = "${config.lib.stylix.colors.base07}ff";
        counter = "${config.lib.stylix.colors.base03}ff";
        border = "${config.lib.stylix.colors.base0B}ff";
      };

      border = {
        width = 2;
        radius = 8;
      };
    };
  };

  home.packages = [fuzzel-power-menu];
}
