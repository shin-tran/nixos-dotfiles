{ ... }:
{
  virtualisation.docker = {
    enable = false;
    enableOnBoot = false;
    autoPrune.enable = true;
  };

  # Enable when you use AI/ML, video transcoding, or rendering.
  hardware.nvidia-container-toolkit.enable = false;
}
