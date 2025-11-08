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
    ./fcitx5.nix
    ./misc.nix
  ];
}
