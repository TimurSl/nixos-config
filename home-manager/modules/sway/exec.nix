{
  config,
  lib,
  pkgs,
  ...
}:

{
  swayExtraConfig = ''
    exec_always --no-startup-id mako
    exec env DISPLAY=:0 xwayland-satellite

    set $term foot
    set $menu wofi --show drun -i
    set $browser firefox
    set $fmanager thunar
  '';
}
