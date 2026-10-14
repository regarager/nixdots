{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # cli
    curl
    wget
    fd
    gh
    imagemagick
    jq
    less
    net-tools
    pay-respects
    pokeget-rs
    tree
    unzip
    yazi
    zip

    # cli programs
    tmux
    pi-coding-agent

    # dev tools
    alejandra
    black
    cmake
    gcc
    isort
    openjdk
    lua
    lua-language-server
    nixd
    nodejs
    prettier
    pyright
    python3
    rust-analyzer
    rustup
    stylua
    tinymist
    tree-sitter
    typst
    uv

    # other programs
    ghostty
    kitty
    firefox
    inputs.waterfox.packages.${pkgs.stdenv.hostPlatform.system}.waterfox-bin
    vesktop
    gthumb
    sioyek

    # mango
    polkit_gnome
    hyprlock
    hypridle
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
