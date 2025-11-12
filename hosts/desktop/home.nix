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

      # User applications
      nitch google-chrome

      # Custom nix search script
      (writeShellApplication {
        name = "ns";
        runtimeInputs = [ fzf (nix-search-tv.overrideAttrs { env.GOEXPERIMENT = "jsonv2"; }) ];
        text = ''exec "${nix-search-tv.src}/nixpkgs.sh" "$@"'';
      })
    ];
  };

  fonts.fontconfig.enable = true;
}
