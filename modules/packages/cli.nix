{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
    tmux
    pi-coding-agent
  ];
}
