{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # important
    git
    curl
    wget
    zsh

    # cli tools
    bat
    eza
    fastfetch
    fd
    fzf
    gh
    imagemagick
    less
    net-tools
    pay-respects
    pokeget-rs
    ripgrep
    tree
    unzip
    yazi
    zip
    zoxide

    # cli programs
    btop
    htop
    tmux
    zellij

    # dev tools
    gcc
    rustup
    nodejs
    jdk
    prettier
    uv
    lua
    cmake
    pyright
    rust-analyzer
    lua-language-server
    black
    isort
    stylua
    typst
    tinymist
    tree-sitter
    nixd
    alejandra

    # other programs
    ghostty
    kitty
    firefox
    inputs.waterfox.packages.${pkgs.stdenv.hostPlatform.system}.waterfox-bin
    nautilus
    vesktop
    gthumb
    sioyek

    # hyprland
    hyprland
    hyprlock
    hypridle
    hyprpaper
    hyprpolkitagent
    hyprshot
    hyprcursor
    mesa
    nwg-displays
    nwg-look
    waypaper
    waybar
    hyprland-qt-support
    mako
    keyd
    grimblast
    rofi
    rofi-power-menu
    brightnessctl
    wl-clipboard

    # theming
    gruvbox-gtk-theme
    gruvbox-plus-icons
    papirus-folders
    gruvbox-dark-gtk
    gruvbox-dark-icons-gtk
    libsForQt5.qt5ct
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
