{ config, pkgs, globals, ... }:

{
  # programs.hyprland = {
  #   enable = true;
  #   withUWSM = false;
  #   xwayland.enable = true;
  # };

  # Display manager for Hyprland
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
      user = "greeter";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk      # Cho file picker
      xdg-desktop-portal-hyprland # Cho screen sharing
    ];
    config.common.default = "*";
  };
}
