{ config, pkgs, globals, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/default.nix

    ../../modules/nixos/services/default.nix
  ];

  # For UEFI
  boot.loader.systemd-boot.enable = false;

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5;

  # For LEGACY
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/sda";

  # Ép NVIDIA DRM tải từ initrd
  # boot.initrd.kernelModules = [ "nvidia_drm" ];

  # Bật kernel mode setting cho NVIDIA
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];
}
