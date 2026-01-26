{ pkgs, unstablePkgs, ... }:
{
  home.packages = with pkgs; [
    materialgram
    zoom-us
    (unstablePkgs.discord.override {
      withOpenASAR = true;
      withEquicord = true;
      withVencord = false;
    })
    unstablePkgs.goofcord
    teamspeak6-client
    halloy
  ];
}
