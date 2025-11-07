{ config, pkgs, globals, ... }:

{
  time.timeZone = "Asia/Ho_Chi_Minh";

  users.users.${globals.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" "seat" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
  ];

  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    # Ép MESA sử dụng backend NVIDIA GBM
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_NAME_SOP_IGNORE_EGL = "1";
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
