{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # XFCE applications
    xfce.xfce4-terminal
    xfce.xfce4-taskmanager
    xfce.xfce4-clipman-plugin
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-screenshooter
    xfce.xfce4-notifyd
    xfce.xfce4-power-manager
    xfce.xfce4-settings
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.ristretto  # Trình xem ảnh
    xfce.mousepad   # Trình soạn thảo văn bản

    # Tiện ích (rofi, feh, scrot dành riêng cho XFCE/X11)
    rofi
    feh
    scrot
    xarchiver
  ];

  # Cấu hình XFCE
  xsession = {
    enable = true;
  };

  # Cấu hình dconf cho XFCE
  dconf.settings = {
    "xfce4-panel/panels/panel-1" = {
      position = "p=6;x=0;y=0";
      length = 100;
      size = 32;
    };

    "xfce4-desktop" = {
      backdrop-cycle-enable = false;
      color-style = 0;
    };

    "xfce4-power-manager" = {
      show-tray-icon = true;
    };

    "xfce4-notifyd" = {
      theme = "Default";
      initial-opacity = 0.9;
    };
  };

  # Tự động khởi động các ứng dụng
  home.file.".config/autostart/fcitx5.desktop" = {
    text = ''
      [Desktop Entry]
      Type=Application
      Name=Fcitx5
      Exec=fcitx5 -d
      X-GNOME-Autostart-enabled=true
      NoDisplay=false
      Hidden=false
    '';
  };

  xdg.configFile."xfce4" = {
    source = ../../../config/xfce4;
    recursive = true;
  };

  # Services
  services = {
    # Notification daemon
    dunst.enable = false;  # Sử dụng xfce4-notifyd thay vì dunst

    # Clipboard manager
    clipmenu.enable = false;  # Sử dụng xfce4-clipman
  };
}
