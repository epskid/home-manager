{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations.jackblack = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux {
        config.allowUnfree = true;
      };
      modules = [ ./home.nix ];
    };
  };
}
