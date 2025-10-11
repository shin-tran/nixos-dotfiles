{ config, pkgs, globals, ... }:
let
  dotfilesConfigPath = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    hypr = "hypr";
    nvim = "nvim";
    wofi = "wofi";
    rofi = "rofi";
    foot = "foot";
    waybar = "waybar";
  };

  configsName = [ "hypr" "nvim" "wofi" "rofi" "foot" "waybar" ];
in
{
  imports = [
    ./modules/theme.nix
  ];

  home.username = globals.username;
  home.homeDirectory = "/home/${globals.username}";
  home.stateVersion = globals.stateVersion;

  programs.git = {
    enable = true;

    userName = globals.git.name;
    userEmail = globals.git.email;

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
      pull.rebase = true;
    };

    ignores = [ ".DS_Store" "*.swp" "*~" ];
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "yes";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "auto";
      controlPersist = "30m";
    };

    matchBlocks.shintran = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/shintran";
    };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw";
      vim = "nvim";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
      nitch
    '';
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };

  home.packages = with pkgs; [
    tree
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    wofi
    nitch
    rofi
    pcmanfm
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        (nix-search-tv.overrideAttrs {
          env.GOEXPERIMENT = "jsonv2";
        })
      ];
      text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
    })
  ];

  # xdg.configFile = builtins.mapAttrs
  #   (name: subpath: {
  #     source = create_symlink "${dotfilesConfigPath}/${subpath}";
  #     recursive = true;
  #   })
  #   configs;

  xdg.configFile = pkgs.lib.genAttrs configsName
    (name: {
      source = create_symlink "${dotfilesConfigPath}/${name}";
      recursive = true;
    });
}
