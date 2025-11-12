{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # XFCE applications
    xfce.xfce4-terminal
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-netload-plugin
    xfce.xfce4-systemload-plugin
    xfce.xfce4-fsguard-plugin
    xfce.xfce4-clipman-plugin
    xfce.xfce4-taskmanager
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-screenshooter
    xfce.xfce4-notifyd
    xfce.xfce4-power-manager
    xfce.xfce4-settings
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.ristretto # Trình xem ảnh
    xfce.mousepad # Trình soạn thảo văn bản

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
  dconf.settings = { };

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

  home.activation.symlinkXfceConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    sourceDir="${config.home.homeDirectory}/nixos-dotfiles/config/xfce4"
    targetLink="${config.home.homeDirectory}/.config"

    verboseEcho "Ensuring parent directory $HOME/.config exists"
    run mkdir -p $VERBOSE_ARG "$(dirname "$targetLink")"

    # -s: symbolic link
    # -f: force (xóa link/thư mục cũ nếu có)
    # -n: đối xử với đích như một file
    verboseEcho "Linking $sourceDir to $targetLink"
    run ln -sfn $VERBOSE_ARG "$sourceDir" "$targetLink"
  '';

  home.activation.symlinkRofiConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    sourceDir="${config.home.homeDirectory}/nixos-dotfiles/config/rofi"
    targetLink="${config.home.homeDirectory}/.config"

    verboseEcho "Ensuring parent directory $HOME/.config exists"
    run mkdir -p $VERBOSE_ARG "$(dirname "$targetLink")"

    if [ -d "$sourceDir" ]; then
      verboseEcho "Linking $sourceDir to $targetLink"
      run ln -sfn $VERBOSE_ARG "$sourceDir" "$targetLink"
    else
      verboseEcho "Rofi config source $sourceDir not found, skipping link."
    fi
  '';

  services = {
    # Notification daemon
    dunst.enable = false; # Sử dụng xfce4-notifyd thay vì dunst

    # Clipboard manager
    clipmenu.enable = false; # Sử dụng xfce4-clipman
  };
}
