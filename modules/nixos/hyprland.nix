{ config, pkgs, globals, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk      # Cho file picker
      xdg-desktop-portal-hyprland # Cho screen sharing
    ];
  };
}
