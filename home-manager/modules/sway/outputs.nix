{
  config,
  lib,
  pkgs,
}:

let
  bg = pkgs.stdenv.mkDerivation {
    name = "sway-bg";
    src = ./bg.jpg;
    installPhase = ''
      mkdir -p $out
      cp $src $out/bg.jpg
    '';
  };
in
{
  swayExtraConfig = ''
    # OUTPUT CONFIG
    output * bg ${bg}/bg.jpg fill
    output eDP-1 mode 2560x1440@180Hz 
  '';
}
