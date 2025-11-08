{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      inter # Font UI (Giao diện) rất đẹp
      noto-fonts # Bộ font đầy đủ, hỗ trợ tiếng Việt

      corefonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.fira-code
      nerd-fonts.hack
      nerd-fonts._0xproto
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      font-awesome
    ];

    fontconfig.defaultFonts = {
      sansSerif = [ "Inter" "Noto Sans" ]; # Ưu tiên Inter, dùng Noto Sans nếu không có
      serif = [ "Noto Serif" ];
      monospace = [ "JetBrainsMono Nerd Font" ]; # Giữ nguyên font terminal của bạn
    };
  };
}
