{ config, pkgs, ... }:

{
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  services.timesyncd.enable = true;
}
