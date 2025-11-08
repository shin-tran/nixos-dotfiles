{ config, pkgs, ... }:

{
  hardware.graphics.enable = true;

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    prime.sync.enable = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    # package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  };
}
