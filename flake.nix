{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      spicetify-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations.jackblack = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          # remove when vesktop is updated!!
          insecure = import nixpkgs {
            inherit system;
            config.permittedInsecurePackages = [ "pnpm-10.29.2" ];
          };

          spicetifyPkgs = spicetify-nix.legacyPackages.${system};
        };

        modules = [
          spicetify-nix.homeManagerModules.spicetify

          ./home.nix
        ];
      };
    };
}
