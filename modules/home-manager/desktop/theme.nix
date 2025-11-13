{ pkgs, ... }:

{
  home.packages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
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

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    iconTheme.name = "Dracula";

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

      #pager-4 button:checked {
        background-image: none;
        background-color: rgba(255, 255, 255, 0.2);
        border-bottom: 3px solid #cf58f0ff;
        color: #ffffff;
        font-weight: bold;
        border-radius: 0;
      }

      #pager-4 button:hover {
        background-image: none;
        background-color: rgba(255, 255, 255, 0.4);
      }
    '';
  };

  home.sessionVariables = {
  };
}
