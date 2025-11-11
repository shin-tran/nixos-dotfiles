{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = false;
    autoPrune.enable = true;
  };

  services = {
    power-profiles-daemon.enable = true;
    openssh.enable = true;

    gnome.gnome-keyring.enable = true;

    # Không gia tốc - thường tốt cho chơi game FPS
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };
  };
}
