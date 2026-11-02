{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    anki
    concord-tui
    ghostty
    kitty
    firefox
    vesktop
    gthumb
    sioyek
    signal-desktop
  ];
}
