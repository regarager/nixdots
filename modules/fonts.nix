{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true; # pulls in Noto, Liberation, etc.

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      maple-mono.truetype
      maple-mono.NF-unhinted
      maple-mono.NF-CN-unhinted
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
        monospace = ["Maple Mono NF"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
