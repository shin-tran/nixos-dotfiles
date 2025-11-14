{ ... }:
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
    ./docker.nix
    ./misc.nix
  ];
}
