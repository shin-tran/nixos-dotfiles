{ config, pkgs, globals, ... }:

{
  services.seatd.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };

  # Display manager for Hyprland
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # Cho file picker
      xdg-desktop-portal-hyprland # Cho screen sharing
    ];
    config.common.default = "*";
  };
}
