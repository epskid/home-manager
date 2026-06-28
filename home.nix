{ ... }:

{
  imports = [
    ./cli/fish.nix
    ./cli/tools.nix
    ./cli/neovim.nix
    ./cli/terminal.nix

    ./gui/tools.nix
    ./gui/games.nix
    ./gui/theming.nix
  ];

  targets.genericLinux.enable = true;

  home.username = "jackblack";
  home.homeDirectory = "/home/jackblack";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
