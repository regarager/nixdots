{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
  ];
}
