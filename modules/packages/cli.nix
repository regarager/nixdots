{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    fd
    gh
    imagemagick
    jq
    lazygit
    less
    net-tools
    pi-coding-agent
    pokeget-rs
    tmux
    tree
    unzip
    wget
    yazi
    zip
  ];
}
