{ config, globals, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = globals.git.name;
        email = globals.git.email;
      };
      init = {
        defaultBranch = "main";
      };
      credential = {
        helper = "store";
      };
      pull = {
        rebase = true;
      };
    };

    settings = {
      safe.directory = [
        "${config.home.homeDirectory}/nixos-dotfiles"
      ];
    };

    ignores = [ ".DS_Store" "*.swp" "*~" ];

    signing = {
      key = globals.git.signingKeyPath;
      signByDefault = true;
      format = "ssh";
    };
  };
}
