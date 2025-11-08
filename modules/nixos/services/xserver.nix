{ config, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "nvidia" ];

      windowManager.i3.enable = true;
    };

    displayManager.defaultSession = "none+i3";

    # displayManager = {
    #   startx.enable = true;
    # };
  };
}
