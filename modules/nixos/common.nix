{ config, pkgs, globals, ... }:

{
  time.timeZone = "Asia/Ho_Chi_Minh";

  programs.dconf.enable = true;

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

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };

  environment.variables = {
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
