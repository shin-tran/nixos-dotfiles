{
  description = "Shin's Nixos dotfiles";

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
      nixosConfigurations."desktop" = nixpkgs.lib.nixosSystem {
        system = globals.system;
        specialArgs = { inherit globals; };

        modules = [
          ./hosts/desktop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit globals; };
              useGlobalPkgs = true;
              useUserPackages = true;

              users.${globals.username} = import ./hosts/desktop/home.nix;

              backupFileExtension = "backup";
            };

            system.stateVersion = globals.stateVersion;
          }
        ];
      };
    };
}
