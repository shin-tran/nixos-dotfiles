{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  services = {
    power-profiles-daemon.enable = true;
    udev.packages = [ pkgs.android-udev-rules ];
    openssh.enable = true;

    # Không gia tốc - thường tốt cho chơi game FPS
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };
  };
}
