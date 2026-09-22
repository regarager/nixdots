{
  description = "NixOS Dots";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim/main";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    shiko-prompt.url = "github:regarager/shiko-prompt";
    shiko-prompt.inputs.nixpkgs.follows = "nixpkgs";
    waterfox.url = "github:Hythera/nix-waterfox";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    shiko-prompt,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations.nixdots = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};

      modules = [
        ./configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-bak";

          home-manager.extraSpecialArgs = {inherit inputs;}; # for HM modules

          home-manager.users.redger = {
            home.username = "redger";
            home.homeDirectory = "/home/redger";
            home.stateVersion = "24.05";
            imports = [
              stylix.homeModules.stylix
              ./modules/home/default.nix
            ];
          };
        }
      ];
    };
  };
}
