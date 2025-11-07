{}:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  services = {
    power-profiles-daemon.enable = true;
    udev.packages = [ pkgs.android-udev-rules ];
    openssh.enable = true;
  };
}
