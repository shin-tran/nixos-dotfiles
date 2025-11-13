{... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "nvidia" ];

      desktopManager.xfce.enable = true;

      displayManager = {
        lightdm.enable = true;

        lightdm.greeters.gtk = {
          enable = true;
          theme.name = "Adwaita-dark";
          iconTheme.name = "Adwaita";
          extraConfig = ''
            [greeter]
            theme-name = Adwaita-dark
            icon-theme-name = Adwaita
          '';
        };
      };
    };

    displayManager = {
      defaultSession = "xfce";
    };
  };
}
