{ config, pkgs, ...}:

{
  programs.vscode.enable = false;

  home.packages = [
    pkgs.vscode.fhs
  ];
}
