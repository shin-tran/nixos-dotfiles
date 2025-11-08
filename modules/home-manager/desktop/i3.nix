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

    # package = pkgs.i3;

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "rofi -show drun -show-icons";

      keybindings = {
        # Mở terminal
        "Mod4+Return" = "exec $terminal";

        # Mở menu (bạn cũng đã định nghĩa $menu nhưng chưa gán)
        "Mod4+d" = "exec $menu";

        # Thêm các phím tắt khác của bạn ở đây...
        # Ví dụ: Đóng cửa sổ
        "Mod4+q" = "kill";

        # Chuyển sang workspace
        # "Mod4+1" = "workspace number 1";
        # "Mod4+2" = "workspace number 2";
        # "Mod4+3" = "workspace number 3";
        # "Mod4+4" = "workspace number 4";
        # "Mod4+5" = "workspace number 5";
        # "Mod4+6" = "workspace number 6";
        # "Mod4+7" = "workspace number 7";
        # "Mod4+8" = "workspace number 8";
        # "Mod4+9" = "workspace number 9";
        # "Mod4+0" = "workspace number 10";
        #
        # # Di chuyển cửa sổ sang workspace
        # "Mod4+Shift+1" = "move container to workspace number 1";
        # "Mod4+Shift+2" = "move container to workspace number 2";
        # "Mod4+Shift+3" = "move container to workspace number 3";
        # "Mod4+Shift+4" = "move container to workspace number 4";
        # "Mod4+Shift+5" = "move container to workspace number 5";
        # "Mod4+Shift+6" = "move container to workspace number 6";
        # "Mod4+Shift+7" = "move container to workspace number 7";
        # "Mod4+Shift+8" = "move container to workspace number 8";
        # "Mod4+Shift+9" = "move container to workspace number 9";
        # "Mod4+Shift+0" = "move container to workspace number 10";
      };

      bars = [
        {
          statusCommand = "${pkgs.i3status}/bin/i3status";
          position = "top";
        }
      ];

      # startup = [
      #   { command = "${pkgs.feh}/bin/feh --bg-fill ~/nixos-dotfiles/walls/Anime-Girl-Rain.png"; always = true; notification = true; }
      #   { command = "picom -b"; notification = false; }
      #   { command = "fcitx5 -d"; notification = false; }
      # ];

      # gap = {
      #   inner = 5;
      #   outer = 5;
      # };
    };
  };
}
