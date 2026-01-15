{
  description = "NixOS with Home Manager and Lanzaboote Secure Boot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      unstable,
      home-manager,
      lanzaboote,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      root = self;
    in
    {

      packages.${system}.dwl-dinexxl = pkgs.callPackage ./pkgs/dwl-dinexxl/default.nix { };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
          lanzaboote.nixosModules.lanzaboote
        ];

        specialArgs = {
          unstablePkgs = import unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit self;
        };
      };

      homeConfigurations.tymur = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/home.nix ];
      };
    };
}
