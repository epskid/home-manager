{ pkgs, ... }:

{
  imports = [
    ./cli/fish.nix
    ./cli/tools.nix
    ./cli/neovim.nix
    ./cli/terminal.nix

    ./gui/tools.nix
    ./gui/games.nix
    ./gui/spotify.nix
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
