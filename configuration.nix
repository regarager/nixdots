{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
    ./hardware-configuration.nix
    ./modules/envvars.nix
    ./modules/docker.nix
    ./modules/fonts.nix
    ./modules/keyd.nix
    ./modules/networking.nix
    ./modules/polkit.nix
    ./modules/packages
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.grub.enable = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
    LidSwitchIgnoreInhibited = "no";
  };

  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.openssh.enable = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.pam.services.swaylock = {};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    pulse.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  users.users."redger" = {
    isNormalUser = true;
    description = "redger";
    extraGroups = ["networkmanager" "wheel"];
  };

  system.copySystemConfiguration = false;
  system.userActivationScripts.zshrc = "touch .zshrc"; # prevents zsh-newuser-install

  nixpkgs.config.allowUnfree = true;

  programs.mango.enable = true;
  programs.zsh.enable = true;
  programs.xwayland.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  nix.settings = {
    cores = 0;
    max-jobs = "auto";
    auto-optimise-store = true;
  };

  # https://nixos.org/manual/nixos/stable/#sec-upgrading
  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "26.05";
}
