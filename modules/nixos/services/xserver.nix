{ config, lib, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };
}
