{ config, pkgs, ... }:

{
  imports = [
    ./nvidia.nix
    ./autologin.nix
    ./networking.nix
    ./hyprpaper.nix
    ./printing.nix
    ./audio.nix
    ./xserver.nix
    ./ibus.nix
  ];
}
