{ config, pkgs, ... }:

{
  imports = [
    ./autologin.nix
    ./networking.nix
    ./hyprpaper.nix
    ./printing.nix
    ./audio.nix
    ./xserver.nix
    ./ibus.nix
  ];
}
