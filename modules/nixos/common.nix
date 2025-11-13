{ config, pkgs, globals, ... }:

{
  time.timeZone = "Asia/Ho_Chi_Minh";

  programs.dconf.enable = true;

  nixpkgs.config = {
    #allowUnfree = true;
    #nvidia.acceptLicense = true;
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
