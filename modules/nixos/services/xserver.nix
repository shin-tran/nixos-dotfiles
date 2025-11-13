{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "nvidia" ];

      desktopManager.xfce.enable = true;

      displayManager = {
        lightdm = {
          enable = true;

          greeters.gtk = {
            enable = true;
            theme.name = "Dracula";
            iconTheme.name = "Dracula";
            cursorTheme = {
              name = "WhiteSur-cursors";
              size = 24;
              package = pkgs.whitesur-cursors;
            };
          };
        };
      };
    };

    displayManager = {
      defaultSession = "xfce";
    };
  };
}
