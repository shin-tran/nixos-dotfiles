{ config, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "nvidia" ];
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true; # Cố gắng chạy SDDM trên Wayland
      };

      defaultSession = "hyprland";
    };
  };
}
