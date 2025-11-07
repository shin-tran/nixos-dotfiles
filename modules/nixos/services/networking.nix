{ config, pkgs, globals, ... }:

{
  networking.hostName = globals.hostname;
  networking.networkmanager.enable = true;

  services.timesyncd.enable = true;
}
