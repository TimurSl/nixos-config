{ pkgs, ... }:
{
  home.username = "tymur";
  home.homeDirectory = "/home/tymur";
  home.stateVersion = "25.05";

  programs.bash.enable = true;
  programs.zsh.enable = true;

  programs.bash.shellAliases = {
    home-rebuild = "home-manager switch --flake /etc/nixos";
    pls-nix-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
  };

  imports = [
    ./modules/socials.nix
    ./modules/games.nix
    ./modules/ue5.nix
    ./modules/tools.nix
  ];

  home.packages = with pkgs; [
    git
    zip
    unzip
    zsh
    fastfetch
    razergenie
    helvum
    qpwgraph
  ];
  nixpkgs.config.allowUnfree = true;
}
