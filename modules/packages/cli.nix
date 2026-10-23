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
    pay-respects
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
