{
  config,
  lib,
  pkgs,
  ...
}:

let
  modules = [
    ./binds.nix
    ./inputs.nix
    ./outputs.nix
    ./exec.nix
    ./style.nix
  ];

  combinedConfig = lib.concatStringsSep "\n" (
    map (m: (import m { inherit config lib pkgs; }).swayExtraConfig) modules
  );
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = null;
    extraConfig = combinedConfig;
  };
}
