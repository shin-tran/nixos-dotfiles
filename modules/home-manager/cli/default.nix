{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./ssh.nix
    ./gpg.nix
  ];
}
