{
  pkgs,
  globals,
  ...
}:

{
  users = {
    mutableUsers = false; # set `true` if you want to use `passwd`
    users.${globals.username} = {
      isNormalUser = true;
      extraGroups = [
        "seat"
        "wheel" # Sudo access
        "video" # GPU/graphics
        "input" # Input devices
        "audio" # Audio devices
        "networkmanager" # Network management
        "docker" # Docker containers
        "adbusers" # Android debugging
      ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;

      # run `mkpasswd -m sha-512` to generate hashed passwd
      hashedPassword = "$6$bv8KudlYK5793sKq$Bwh6MTta9S/y./HPtglTGULDfIIsNmj3FCCSnz42Mg3QLJWse27i.hDD.CUQCclvdl5HVccDznc5mad6awRVY1";
    };
  };
}
