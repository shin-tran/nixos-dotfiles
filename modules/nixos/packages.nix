{ config, pkgs, ... }:

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

    # Terminal emulators
    foot
    kitty

    # Wayland/Hyprland interface
    waybar
    hyprpaper
    wofi               # App launcher
    dunst              # Notification daemon
    wl-clipboard       # Clipboard manager
    
    # Screenshot & recording
    grim               # Screenshot
    slurp              # Screen area selector
    swappy             # Screenshot editor
    wf-recorder        # Screen recording

    # System tools
    brightnessctl      # Brightness control
    pamixer            # Volume control (CLI)
    pavucontrol        # Volume control (GUI)
    networkmanagerapplet  # Network manager GUI
    
    # File managers
    thunar             # GUI file manager
    lf                 # Terminal file manager
    
    # Search tools (needed for nvim telescope)
    ripgrep
    fd
    fzf
    
    # System monitoring
    btop
    htop
    fastfetch
  ];
}
