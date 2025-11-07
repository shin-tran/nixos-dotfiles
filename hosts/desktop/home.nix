{ config, pkgs, globals, ... }:

{
  imports = [
    ../../modules/home-manager/cli/git.nix
    ../../modules/home-manager/cli/zsh.nix
    ../../modules/home-manager/cli/ssh.nix

    ../../modules/home-manager/desktop/theme.nix
    ../../modules/home-manager/desktop/hyprland.nix
    ../../modules/home-manager/desktop/waybar.nix
    ../../modules/home-manager/desktop/wofi.nix
    ../../modules/home-manager/desktop/foot.nix
    ../../modules/home-manager/desktop/hyprpaper.nix

    ../../modules/home-manager/editors/nvim.nix
  ];

  home.username = globals.username;
  home.homeDirectory = "/home/${globals.username}";
  home.stateVersion = globals.stateVersion;

  home.packages = with pkgs; [
    # Development tools
    nil                # Nix language server
    nixpkgs-fmt        # Nix formatter
    nodejs
    bun

    # User applications
    nitch              # System info
    google-chrome      # Browser

    # File manager

    # Custom nix search script
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        (nix-search-tv.overrideAttrs {
          env.GOEXPERIMENT = "jsonv2";
        })
      ];
      text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
    })
  ];
}
