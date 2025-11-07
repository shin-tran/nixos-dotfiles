{ config, pkgs, ... }:

{
  xdg.configFile."nvim" = {
    source = ../../../config/nvim;
    recursive = true;
  };
}
