{ pkgs, globals, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  # For UEFI
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.efiSupport = true;

  # For LEGACY 
  boot.loader.grub.device = "/dev/sda";

  services.getty.autologinUser = globals.username;
  services.timesyncd.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  users.users.${globals.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.firefox.enable = true;

  services.httpd = {
    enable = true;
    enablePHP = true;
    adminAddr = globals.git.email;

    user = globals.username;
    group = "users";

    virtualHosts."mammamstore.localhost" = {
      documentRoot = "/home/${globals.username}/workspace/php/mam-mam-store";
      extraConfig = ''
        <Directory "/home/${globals.username}/workspace/php/mam-mam-store">
          Options Indexes FollowSymLinks
          AllowOverride All
          Require all granted
        </Directory>
      '';
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  networking.extraHosts = ''
    127.0.0.1 mammamstore.localhost
  '';

  environment.systemPackages = with pkgs; [
    vim
    wget
    git

    #terminal
    foot
    kitty

    #giao dien
    waybar
    hyprpaper

    #tien ich
    grim
    slurp
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

