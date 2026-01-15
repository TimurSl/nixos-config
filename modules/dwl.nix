{
  config,
  pkgs,
  flakeSelf,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    texlivePackages.jetbrainsmono-otf
    wbg
    wmenu
    foot
    grim
    wl-clipboard
    slurp
    libinput
    wayland
    wlroots_0_18
    libxkbcommon
    wayland-protocols
    pkg-config
    libxcb
    libxcb-wm
    wlroots
    xwayland
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    tllist
    (flakeSelf.packages.${pkgs.stdenv.hostPlatform.system}.dwl-dinexxl)

  ];

  environment.etc."wayland-sessions/dwl.desktop".text = ''
    [Desktop Entry]
    Name=dwl
    Comment=Dynamic Window Manager for Wayland
    Exec=dwl
    Type=Application
    DesktopNames=dwl
  '';

}
