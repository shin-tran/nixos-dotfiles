{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      show = "drun";
      allow_images = true;
      width = "700px";
      lines = 7;
    };

    style = ''
      /* Tokyonight-inspired Wofi */
      * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 16px;
          font-weight: bold;
      }

      window {
          background-color: #24283b;
          border: 2px solid #444b6a;
          border-radius: 6px;
      }

      #input {
          background-color: #24283b;
          color: #7aa2f7; /* tokyo: kl */
          padding: 11px;
          border: none;
          border-radius: 6px 6px 0 0;
          border-bottom: 2px solid #444b6a;
      }

      #input:focus {
          outline: none;
      }

      #inner-box {
          background-color: #24283b;
      }

      #scroll {
          padding: 8px;
      }

      #entry {
          color: #7aa2f7; /* tokyo: kl */
          padding: 8px;
          border-radius: 4px;
      }

      #entry:selected {
          background-color: #9274ca; /* tokyo: hv */
          color: #000000;
      }

      #text {
          padding: 5px;
      }

      image {
          margin-right: 10px;
      }
    '';
  };
}
