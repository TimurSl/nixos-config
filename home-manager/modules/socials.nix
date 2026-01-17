{ pkgs, unstablePkgs, ... }:
{
  home.packages = with pkgs; [
    materialgram
    zoom-us
    (unstablePkgs.discord.override {
      withOpenASAR = false;
      withEquicord = true;
      withVencord = false;
    })
    teamspeak6-client
  ];
}
