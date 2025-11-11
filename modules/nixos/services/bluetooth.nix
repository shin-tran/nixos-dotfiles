{ config, pkgs, ...}:

{
  # Enable bluetooth
  hardware.bluetooth = {
    enable = false;
    powerOnBoot = true;
  };

  services.blueman.enable = false;
}
