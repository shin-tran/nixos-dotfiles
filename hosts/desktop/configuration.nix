{ config, pkgs, globals, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/common.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/packages.nix

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
}
