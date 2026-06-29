{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  targets.genericLinux.enable = true;

  imports = [
    ./cli/apps.nix
    ./cli/fish.nix
    ./cli/helix.nix
    ./cli/terminal.nix

    ./gui/apps.nix
    ./gui/games.nix
    ./gui/theming.nix
  ];

  home.username = "jackblack";
  home.homeDirectory = "/home/jackblack";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
