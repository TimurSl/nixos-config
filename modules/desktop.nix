{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;
  services.desktopManager.cosmic.enable = false;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  #services.xserver.desktopManager.lxqt.enable = true;
  services.flatpak.enable = true;

  programs.seahorse.enable = false;

  xdg.portal = {
    enable = true;

    # Явно указываем, что Plasma должен использовать именно KDE-портал
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];

    config = {
      common.default = [ "kde" ];
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  services.xserver.displayManager.sessionCommands = ''
    export KWIN_DRM_NO_AMS=1
  '';

  programs.firefox.enable = true;

}
