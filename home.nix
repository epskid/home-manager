{ pkgs, ... }:

{
  imports = [
    ./cli/apps.nix
    ./cli/fish.nix
    ./cli/neovim.nix
    ./cli/terminal.nix

    ./gui/apps.nix
    ./gui/games.nix
    ./gui/theming.nix
  ];

  targets.genericLinux.enable = true;

  home.username = "jackblack";
  home.homeDirectory = "/home/jackblack";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
