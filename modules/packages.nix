{pkgs, ...}: {
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
    zip
    zoxide

    # cli programs
    btop
    htop
    tmux

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
    nautilus
    vesktop
    gthumb

    # hyprland
    hyprland
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
  ];
}
