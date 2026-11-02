{...}: {
  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };

    liveRestore = false;
    storageDriver = "btrfs";
  };
}
