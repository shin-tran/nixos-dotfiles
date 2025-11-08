{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
    # ./hyprland.nix
    # ./waybar.nix
    # ./wofi.nix
    # ./foot.nix
    # ./hyprpaper.nix
    ./i3.nix
  ];
}
