{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cmake
    gcc
    lua
    nodejs
    openjdk
    python3
    rustup
    tree-sitter
    typst
    uv
  ];
}
