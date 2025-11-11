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

    windowManager.xfce = {
      enable = true;
    };
  };

  # Cấu hình file manager Thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # Cấu hình dconf cho XFCE
  dconf.settings = {
    "xfce4-panel/panels/panel-1" = {
      position = "p=6;x=0;y=0";
      length = 100;
      size = 32;
    };

    "xfce4-keyboard-shortcuts" = {
      "custom/Super_L" = "xfce4-popup-whiskermenu";
      "custom/<Super>Return" = "xfce4-terminal";
      "custom/<Super>d" = "rofi -show drun -show-icons";
      "custom/<Super>e" = "thunar";
      "custom/Print" = "xfce4-screenshooter";
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

  # Cấu hình background
  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml" = {
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <channel name="xfce4-desktop" version="1.0">
        <property name="backdrop" type="empty">
          <property name="screen0" type="empty">
            <property name="monitoreDP-1" type="empty">
              <property name="workspace0" type="empty">
                <property name="color-style" type="int" value="0"/>
                <property name="image-style" type="int" value="5"/>
                <property name="last-image" type="string" value="${config.home.homeDirectory}/nixos-dotfiles/walls/Anime-Girl-Rain.png"/>
              </property>
            </property>
          </property>
        </property>
      </channel>
    '';
  };

  # Services
  services = {
    # Notification daemon
    dunst.enable = false;  # Sử dụng xfce4-notifyd thay vì dunst

    # Clipboard manager
    clipmenu.enable = false;  # Sử dụng xfce4-clipman
  };
}
