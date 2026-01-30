{ config, ... }:
{
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    #    persistenced = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = false;
  };

  hardware.openrazer.enable = true;
  hardware.graphics.enable = true;
  services.resolved.enable = true;
}
