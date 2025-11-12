{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./users.nix
    ./fonts.nix
    ./packages.nix
    # ./hyprland.nix
  ];
}
