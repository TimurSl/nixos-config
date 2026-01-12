{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.wofi;
in
{
  options.my.wofi.enable = lib.mkEnableOption "Enable Wofi launcher";

  config = lib.mkIf cfg.enable {

    xdg.configFile."wofi/config".text = ''
      width=640
      height=400
      columns=1
      mode=drun
      term=foot
      location=center
      prompt=Search
      insensitive=true
      hide_scroll=true
      no_actions=true
      allow_images=true
      image_size=40
    '';

    xdg.configFile."wofi/style.css".text = ''
      * {
        font-family: JetBrains Mono;
        font-size: 12px;
      }

      window {
        margin: 0px;
        border: 1px solid #dfbf8e;
        background-color: #282828;
      }

      #input {
        margin: 5px;
        border: none;
        color: #dfbf8e;
        background-color: #282828;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: #282828;
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: #282828;
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: #dfbf8e;
      }

      #entry:selected {
        background-color: #282828;
      }
    '';
  };
}
