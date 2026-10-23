{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    anki
    concord-tui
    ghostty
    kitty
    firefox
    inputs.waterfox.packages.${pkgs.stdenv.hostPlatform.system}.waterfox-bin
    vesktop
    gthumb
    sioyek
    signal-desktop
  ];
}
