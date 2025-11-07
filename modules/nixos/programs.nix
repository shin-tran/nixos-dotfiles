{ config, pkgs, ... }:

{
  programs = {
    nix-ld.enable = true;
    adb.enable = true;
  };
}
