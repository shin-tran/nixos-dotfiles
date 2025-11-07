{ config, pkgs, globals, ... }:

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

    ignores = [ ".DS_Store" "*.swp" "*~" ];

    # Bạn cũng có thể kích hoạt signing ở đây
    # signing = {
    #   key = globals.git.signingKey; # (Bạn cần thêm signingKey vào globals.nix)
    #   signByDefault = true;
    # };
  };
}
