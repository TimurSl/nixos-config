{ pkgs, ... }:

{
  services.xserver.enable = false;

  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;

  services.desktopManager.gnome.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.desktopManager.cosmic.enable = false;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      common.default = [ "gtk" ];
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.flatpak.enable = true;
  programs.firefox.enable = true;

  programs.seahorse.enable = false;
}
