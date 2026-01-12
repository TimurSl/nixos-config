{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.sway;

  swayExtraConfig = import ./config.nix {
    inherit config lib pkgs;
  };
in
{
  options.my.sway.enable = lib.mkEnableOption "Enable my sway configuration";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      config = null;
      extraConfig = swayExtraConfig;
    };
  };
}
