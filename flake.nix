{
  description = "Hyprland on Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      globals = import ./lib/globals.nix;
    in
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        system = globals.system;

        # truyen globals cho tat ca module con
        specialArgs = { inherit globals; };

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit globals; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${globals.username} = import ./home.nix;
              backupFileExtension = "backup";
            };

            system.stateVersion = globals.stateVersion;
          }
        ];
      };
    };
}
