{pkgs, ...}: {
  networking = {
    hostName = "nix";
    networkmanager = {
      enable = true;
      plugins = [pkgs.networkmanager-openvpn];
    };
    hosts = {
      "127.0.0.1" = ["localhost"];
      "127.0.1.1" = ["nix"];
    };
  };

  services.netbird = {
    enable = true;
    useRoutingFeatures = "client";
  };

  environment.etc.hosts.mode = "0700"; # makes /etc/hosts writable
}
