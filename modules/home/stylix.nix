{pkgs, ...}: {
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.fonts = {
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

  # Stylix sets `nixpkgs.overlays`, which conflicts with
  # `home-manager.useGlobalPkgs = true` (the overlays are ignored there anyway).
  stylix.overlays.enable = false;

  # Rofi is configured manually, and stylix currently defines the renamed
  # `programs.rofi.font` option.
  stylix.targets.rofi.enable = false;

  stylix.targets.nixvim.enable = false;
  stylix.targets.waybar.enable = false;
  stylix.targets.fzf.enable = false;
}
