{ pkgs, ... }:
{
  home.packages = with pkgs; [
    materialgram
    zoom-us
    (discord.override {
      withOpenASAR = false;
      withEquicord = true;
      withVencord = false;
    })
    teamspeak6-client
  ];
}
