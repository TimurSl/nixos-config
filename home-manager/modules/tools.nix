{ pkgs, ... }:
{
  home.packages = with pkgs; [
    krita
    gh
    nixfmt-rfc-style
    jetbrains.rider
    jetbrains.pycharm
    gitkraken
    yt-dlp
    subversion
    rnote
    #bittorrent
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        jnoortheen.nix-ide
      ];

      userSettings = {
        "editor.formatOnSave" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}
