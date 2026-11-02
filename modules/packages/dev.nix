{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cmake
    gcc
    lua
    nodejs
    openjdk
    python3
    cargo
    rustc
    tree-sitter
    typst
    uv
  ];
}
