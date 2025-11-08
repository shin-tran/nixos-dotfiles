{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./fonts.nix
    # ./hyprland.nix
    ./packages.nix
  ];
}
