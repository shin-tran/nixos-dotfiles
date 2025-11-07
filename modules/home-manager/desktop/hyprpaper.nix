{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/nixos-dotfiles/walls/Anime-Girl-Rain.png"
      ];
      wallpaper = [
        ",~/nixos-dotfiles/walls/Anime-Girl-Rain.png"
      ];

      # Bật IPC để có thể thay đổi hình nền
      # bằng dòng lệnh (ví dụ: hyprctl hyprpaper wallpaper ...)
      ipc = "on";
    };
  };
}
