{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lutris
    mangohud
    protonup-qt
    obs-studio
  ];
}
