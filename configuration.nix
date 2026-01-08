{
  config,
  pkgs,
  unstablePkgs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  # прокидываем unstable дальше в модули
  _module.args.unstable = unstablePkgs;

  imports = [
    ./hardware-configuration.nix
    ./modules/base.nix
    ./modules/nix.nix
    ./modules/boot.nix
    ./modules/users.nix
    ./modules/desktop.nix
    ./modules/sound.nix
    ./modules/bluetooth.nix
    ./modules/drivers.nix
    ./modules/steam.nix
    ./modules/services.nix
    ./modules/ue5.nix
  ];
}
