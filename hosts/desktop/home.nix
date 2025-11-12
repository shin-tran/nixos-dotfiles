{ config, pkgs, globals, ... }:

{
  imports = [
    ../../modules/home-manager/cli/default.nix

    ../../modules/home-manager/desktop/default.nix

    ../../modules/home-manager/editors/default.nix
  ];

  home = {
    username = globals.username;
    homeDirectory = "/home/${globals.username}";
    stateVersion = globals.stateVersion;
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    packages = with pkgs; [
      # Development tools
      nil nixpkgs-fmt nodejs bun

      nixd     # Language server cho Nix
      nixfmt   # Để format code Nix

      # User applications
      nitch google-chrome
    ];
  };

  fonts.fontconfig.enable = true;
}
