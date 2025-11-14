{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core utilities
    vim
    neovim
    wget
    curl
    git
    gcc
    unzip
    zip
    tree

    # Wayland/Hyprland interface - COMMENT TẠM THỜI (chỉ dùng cho Wayland/Hyprland)
    # waybar
    # hyprpaper
    # wofi # App launcher
    # dunst # Notification daemon (XFCE dùng xfce4-notifyd)
    # wl-clipboard # Clipboard manager

    # Screenshot & recording - CHỈ CHO WAYLAND
    # grim # Screenshot
    # slurp # Screen area selector
    # swappy # Screenshot editor
    # wf-recorder # Screen recording

    # System tools
    # brightnessctl # Brightness control - có thể không cần cho desktop
    pamixer # Volume control (CLI)
    pavucontrol # Volume control (GUI)
    networkmanagerapplet # Network manager GUI

    # File managers
    xfce.thunar # GUI file manager
    # kdePackages.dolphin

    # Search tools (needed for nvim telescope)
    ripgrep
    fd
    fzf

    # System monitoring
    btop
    htop
    fastfetch

    qt6Packages.fcitx5-configtool
    pkgs.xorg.xinit

    # Themes
    whitesur-cursors
    dracula-theme
    dracula-icon-theme

    # === KDE Plasma (X11) Tối thiểu ===
    plasma-desktop         # Gói lõi cho Plasma (phiên bản X11)
    systemsettings         # Cần thiết để vào System Settings
    kde-gtk-config         # GÓI QUAN TRỌNG: để đồng bộ theme Qt/GTK
    kio-extras             # Thêm các tính năng I/O (ví dụ: xem trước file)
    kdePackages.dolphin    # Trình quản lý file
  ];
}
