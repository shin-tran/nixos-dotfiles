{ config, pkgs, globals, ... }:

{
  time.timeZone = "Asia/Ho_Chi_Minh";

  users.users.${globals.username} = {
    isNormalUser = true;
    extraGroups = [
      "seat"
      "wheel"           # Sudo access
      "video"           # GPU/graphics
      "input"           # Input devices
      "audio"           # Audio devices
      "networkmanager"  # Network management
      "docker"          # Docker containers
      "adbusers"        # Android debugging
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };

  environment.variables = {
    # Ép MESA sử dụng backend NVIDIA GBM
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_NAME_SOP_IGNORE_EGL = "1";

    NIXOS_OZONE_WL = "1"; # Enable Wayland for Electron apps
    WLR_NO_HARDWARE_CURSORS = "1"; # Fix cursor issues on NVIDIA
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
