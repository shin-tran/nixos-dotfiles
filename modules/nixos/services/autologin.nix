{ config, pkgs, globals, ... }:

{
  services.getty.autologinUser = globals.username;
}
