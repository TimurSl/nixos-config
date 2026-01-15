{
  config,
  pkgs,
  lib,
  self,
  system,
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

    self.packages.${pkgs.system}.dwl-dinexxl
  ];

  environment.etc."xdg/wayland-sessions/dwl.desktop".text = ''
    [Desktop Entry]
    Name=dwl
    Comment=Dynamic Window Manager for Wayland
    Exec=${self.packages.${pkgs.system}.dwl-dinexxl}/bin/dwl
    Type=Application
    DesktopNames=dwl
  '';

}
