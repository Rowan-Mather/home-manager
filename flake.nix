{
  description = "Home Manager configuration of rowan";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixfmt = {
      url = "github:NixOS/nixfmt/1f2589cb7198529c6c1eec9699eccd4d507d3600";
    };
  };

  outputs = { nixpkgs, home-manager, sops-nix, nixfmt, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."rowan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          sops-nix.homeManagerModules.sops
        ];
        extraSpecialArgs = { inherit nixfmt; };

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        #extraSpecialArgs = { inherit sops-nix; };
      };
    };
}
