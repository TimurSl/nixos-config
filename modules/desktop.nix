{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.gdm.enable = false;
  services.displayManager.gdm.wayland = false;

  #services.desktopManager.gnome.enable = true;
  #services.gnome.gnome-keyring.enable = false;
  services.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.displayManager.ly.enable = true;

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

  #programs.seahorse.enable = false;
  #security.pam.services = {
  #  login.enableGnomeKeyring = false;
  #  gdm.enableGnomeKeyring = false;
  #  sddm.enableGnomeKeyring = false;
  #  sudo = {};
  #};
}
