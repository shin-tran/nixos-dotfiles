{
  description = "Shin's Nixos dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      globals = import ./lib/globals.nix;
    in
    {
      nixosConfigurations.${globals.hostname} = nixpkgs.lib.nixosSystem {
        system = globals.system;
        specialArgs = {
          inherit globals inputs;
          pkgs = import nixpkgs {
            system = globals.system;
            config = {
              allowUnfree = true;
              nvidia.acceptLicense = true;
            };
          };
         };

        modules = [
          ./hosts/${globals.hostname}/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit globals inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;

              users.${globals.username} = import ./hosts/${globals.hostname}/home.nix;

              backupFileExtension = "backup";
            };

            system.stateVersion = globals.stateVersion;
          }
        ];
      };
    };
}
