{ pkgs, ... }:

{
  home.packages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra

    whitesur-cursors
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    name = "WhiteSur-cursors";
    package = pkgs.whitesur-cursors;
    size = 24;
  };

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
    iconTheme.name = "Adwaita";

    font = {
      name = "Inter";
      size = 12;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk3.extraCss = ''
      .xfce4-panel {
        background-color: rgba(0, 0, 0, 0);
      }
    '';
  };

  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=Adwaita-dark
    gtk-icon-theme-name=Adwaita
    gtk-cursor-theme-name=WhiteSur-cursors
    gtk-cursor-theme-size=24
    gtk-font-name=Inter 12
    gtk-application-prefer-dark-theme=1
  '';

  xdg.configFile."gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=Adwaita-dark
    gtk-icon-theme-name=Adwaita
    gtk-cursor-theme-name=WhiteSur-cursors
    gtk-cursor-theme-size=24
    gtk-font-name=Inter 12
    gtk-application-prefer-dark-theme=1
  '';

  home.sessionVariables = {
    XCURSOR_THEME = "WhiteSur-cursors";
    XCURSOR_SIZE = "24";
  };
}
