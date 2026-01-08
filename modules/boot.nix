{ pkgs, lib, unstable, ... }: {
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 2;
  boot.kernelPackages = pkgs.linuxPackages;
  boot.supportedFilesystems = ["ntfs"];
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  boot.loader.systemd-boot.enable = lib.mkForce false;
  
  boot.loader.timeout = 5;


  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=0"
    "video=simpledrm:off"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];
}
