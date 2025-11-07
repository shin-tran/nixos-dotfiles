{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services.timesyncd.enable = true;
}
