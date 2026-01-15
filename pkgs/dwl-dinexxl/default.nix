{ lib, stdenv, fetchgit, pkg-config, wayland, wlroots, libinput, xorg }:

stdenv.mkDerivation rec {
  pname = "dwl-dinex";
  version = "2026-01-15";

  src = fetchgit {
    url = "https://codeberg.org/DINEXXL/dwl-dotfiles.git";
    rev = "master";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland
    wlroots
    libinput
    xorg.libX11
    xorg.libXcursor
  ];

  # Патчи, если есть *.patch в репозитории
  patches = lib.optional (builtins.pathExists "${src}/patches") (lib.mapAttrsToList (_: v: "${src}/patches/${v}") (builtins.readDir "${src}/patches"));

  postPatch = ''
    # Если в репе есть config.h — копируем
    if [ -f ${src}/config.h ]; then
        cp ${src}/config.h config.h
    fi
  '';

  makeFlags = [
    "PREFIX=$(out)"
  ];

  installPhase = ''
    make clean install
  '';

  meta = with lib; {
    description = "dwl build from DINEXXL dotfiles";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}

