{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
    shellAliases = {
      btw = "echo i use nixos, btw";
      vim = "nvim";
    };
    initContent = ''
      nitch

      function nrs() {
        if [ -z "$1" ]; then
          echo "Lỗi: Vui lòng cung cấp tên host."
          echo "Ví dụ: nrs desktop"
          return 1
        fi
        sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nixos-dotfiles#$1
      }
    '';
    # profileExtra = ''
    #   if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ];
    #   then
    #     exec uwsm start -S hyprland-uwsm.desktop
    #   fi
    # '';
  };

  programs.bash.enable = false;
}
