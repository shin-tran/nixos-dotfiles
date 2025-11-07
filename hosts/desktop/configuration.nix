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

  # Bật driver NVIDIA
  # services.xserver.videoDrivers = [ "nvidia" ];
  # Tùy chọn này sẽ tự động thêm driver vào initrd và xserver.
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  # Ép NVIDIA DRM tải từ initrd
  # boot.initrd.kernelModules = [ "nvidia_drm" ];

  # Bật kernel mode setting cho NVIDIA
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  # Bật tính năng quản lý driver OpenGL
  hardware.graphics.enable = true;

  # Kích hoạt kernel mode setting (KMS) cho Wayland
  hardware.nvidia.modesetting.enable = true;

  # Tối ưu cho driver độc quyền
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.open = false;

  hardware.nvidia.prime.sync.enable = true;
}
