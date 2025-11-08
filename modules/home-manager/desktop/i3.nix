{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    rofi
    feh
    picom
    i3status
    i3lock
    scrot
  ];

  xsession.enable = true;

  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "rofi -show drun -show-icons";

      keybindings = let
        mod = modifier;
      in lib.mkOptionDefault {
        # Terminal
        "${mod}+Return" = "exec ${terminal}";

        # App launcher
        "${mod}+d" = "exec ${menu}";

        # Kill window
        "${mod}+Shift+q" = "kill";

        # Reload/restart i3
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";

        # Focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # Move
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # Workspaces
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        # Move to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
      };

      bars = [
        {
          statusCommand = "${pkgs.i3status}/bin/i3status";
          position = "top";
        }
      ];

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-fill ~/nixos-dotfiles/walls/Anime-Girl-Rain.png";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.picom}/bin/picom -b";
          notification = false;
        }
        {
          command = "fcitx5 -d";
          notification = false;
        }
      ];

      gaps = {
        inner = 5;
        outer = 5;
      };
    };
  };
}
