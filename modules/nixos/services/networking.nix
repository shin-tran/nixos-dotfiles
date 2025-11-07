{ config, pkgs, globals, ... }:

{
  networking = {
    hostName = globals.hostname;
    wireless.enable = false;
    networkmanager.enable = true;
    firewall.enable = false;
  };

  services.timesyncd.enable = true;
}
