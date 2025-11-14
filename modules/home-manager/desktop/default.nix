{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./kitty.nix
    # ./hyprland.nix
    # ./waybar.nix
    # ./wofi.nix
    # ./foot.nix
    # ./hyprpaper.nix
    # ./xfce.nix
  ];
}
