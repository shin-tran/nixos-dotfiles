{ config, pkgs, globals, ... }:

{
  users.users.${globals.username} = {
    isNormalUser = true;
    extraGroups = [
      "seat"
      "wheel" # Sudo access
      "video" # GPU/graphics
      "input" # Input devices
      "audio" # Audio devices
      "networkmanager" # Network management
      "docker" # Docker containers
      "adbusers" # Android debugging
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
