{ pkgs, ... }: {
  home.packages = with pkgs; [
    materialgram 
    zoom-us
    (discord.override {
      withOpenASAR = false;
      withEquicord = false;
      withVencord = false;
    })
    teamspeak6-client
  ];
}
