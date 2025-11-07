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

  i18n.defaultLocale = "en_US";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US";
    LC_IDENTIFICATION = "en_US";
    LC_MEASUREMENT = "en_US";
    LC_MONETARY = "en_US";
    LC_NAME = "en_US";
    LC_NUMERIC = "en_US";
    LC_PAPER = "en_US";
    LC_TELEPHONE = "en_US";
    LC_TIME = "en_US";
  };

  # Set environment variables for IBus
  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };
}
