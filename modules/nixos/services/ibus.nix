{ config, pkgs, ... }:

{
  # Input method for Vietnamese (and other languages)
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      bamboo  # Vietnamese input method
      # unikey  # Alternative Vietnamese input (if needed)
    ];
  };

  # Set environment variables for IBus
  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };
}
