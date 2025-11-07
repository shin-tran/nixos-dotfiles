{ config, pkgs, globals, ... }:

{
  time.timeZone = "Asia/Ho_Chi_Minh";

  users.users.${globals.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
