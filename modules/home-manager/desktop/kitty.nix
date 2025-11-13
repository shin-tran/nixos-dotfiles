{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Macchiato";
  };
}
