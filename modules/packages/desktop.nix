{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    polkit_gnome
    swaybg
    hyprpicker
    mesa
    nwg-displays
    nwg-look
    grimblast
    msnap
    brightnessctl
    wl-clipboard
    gruvbox-gtk-theme
    gruvbox-plus-icons
    papirus-folders
    gruvbox-dark-gtk
    gruvbox-dark-icons-gtk
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugins
    qt6Packages.qtwayland
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    libappindicator
    libnotify
  ];
}
