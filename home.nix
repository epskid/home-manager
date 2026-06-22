{ config, pkgs, ... }:

{
  targets.genericLinux.enable = true;

  home.username = "jackblack";
  home.homeDirectory = "/home/jackblack";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    neovim
    john
    olympus
    aseprite
    vvvvvv
    cemu-ti
    godot
    nerd-fonts.caskaydia-cove
  ];

  fonts.fontconfig.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "/bin/fish";
      colors = {
        primary = {
          background = "#32302f";
          foreground = "#ebdbb2";
        };
        bright = {
          black = "#928374";
          blue = "#83a598";
          cyan = "#8ec07c";
          green = "#b8bb26";
          magenta = "#d3869b";
          red = "#fb4934";
          white = "#fbf1c7";
          yellow = "#fabd2f";
        };
        normal = {
          black = "#3c3836";
          blue = "#458588";
          cyan = "#689d6a";
          green = "#98971a";
          magenta = "#b16286";
          red = "#cc241d";
          white = "#a89984";
          yellow = "#d79921";
        };
      };
      font = {
        size = 12;
        normal.family = "CaskaydiaCove Nerd Font";
      };
      window = {
        decorations = "None";
        dynamic_padding = true;
        padding = {
          x = 10;
          y = 10;
        };
        opacity = 0.9;
      };
    };
  };

  programs.ripgrep.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      italic-text = "always";
    };
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    enableFishIntegration = true;
  };

  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
    '';
    shellAliases = {
      ls = "eza";
      cat = "bat";
    };
  };

  programs.home-manager.enable = true;
}
