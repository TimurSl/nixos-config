{
  stdenv,
  fetchgit,
  pkg-config,
  wayland,
  wlroots_0_18,
  libinput,
  libxkbcommon,
  wayland-protocols,
  libxcb,
  libxcb-wm,
  xwayland,
  xdg-desktop-portal,
  xdg-desktop-portal-wlr,
  tllist,
  jetbrains-mono,
  wbg,
  wmenu,
  foot,
  grim,
  wl-clipboard,
  slurp,
  lib,
  pixman,
  fcft,
  dbus,
  gcc,
  gnumake,
  libdrm,
  wayland-scanner,
  ...
}:

stdenv.mkDerivation rec {
  pname = "dwl-dinexxl";
  version = "2026-01-15";

  src = fetchgit {
    url = "https://codeberg.org/DINEXXL/dwl-dotfiles.git";
    rev = "main";
    sha256 = "sha256-FozRR3eO2q/7s34ocy8jkPtYcIhoNBQ6MYidY1aK3Is=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland
    wlroots_0_18
    libinput
    libxkbcommon
    wayland-protocols
    libxcb
    libxcb-wm
    xwayland
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    tllist

    jetbrains-mono
    wbg
    wmenu
    foot
    grim
    wl-clipboard
    slurp

    pixman
    fcft
    dbus
    gcc
    gnumake
    libdrm
    wayland-scanner
  ];

  patches = lib.optionals (builtins.pathExists "${src}/patches") (
    map (p: "${src}/patches/${p}") (builtins.attrNames (builtins.readDir "${src}/patches"))
  );

  postPatch = ''
    if [ -f ${src}/config.h ]; then
      cp ${src}/config.h config.h
    fi
  '';

  # Makefile DINEXXL не поддерживает PREFIX нормально
  # Поэтому ручной installPhase === единственно корректный способ
  installPhase = ''
    mkdir -p $out/bin
    cp dwl $out/bin/

    # Если есть дополнительные скрипты или темы:
    if [ -d scripts ]; then
      mkdir -p $out/share/dwl/scripts
      cp -r scripts/* $out/share/dwl/scripts/
    fi
  '';

  meta = {
    description = "DINEXXL patched dwl build with systray, centered title, bar, autostart, etc.";
    platforms = lib.platforms.linux;
    license = lib.licenses.mit;
  };
}
