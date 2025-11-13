{ pkgs, ... }:

{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3; # Hộp thoại nhập pass chuẩn GTK
    enableZshIntegration = true;
  };
}
