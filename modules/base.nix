{ pkgs, ... }:
{
  time.timeZone = "Europe/Kyiv";
  networking.hostName = "nixos";
  #i18n.defaultLocale = "ru_UA.UTF-8";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ru_UA.UTF-8/UTF-8"
  ];

  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    vim
    wget
    nano
    efibootmgr
    sbctl
    dosfstools
    openrazer-daemon
    python3
    steam-run
    clang
    cmake
    ninja
    direnv
    gnumake
    file
    home-manager
    hyperhdr
    pulseaudio
    ntfs3g
    ripgrep
    gnome-tweaks
  ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
  system.autoUpgrade.enable = true;
}
