{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.maple-mono.NF-unhinted;
        name = "Maple Mono NF";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    overlays.enable = false;
    targets.firefox = {
      enable = true;
      profileNames = ["default"];
      colorTheme.enable = true;
    };
    targets.fuzzel.enable = false;
    targets.nixvim.enable = false;
    targets.waybar.enable = false;
    targets.fzf.enable = false;
  };
}
