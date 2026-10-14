{config, ...}: {
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
}
