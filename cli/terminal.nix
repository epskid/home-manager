{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
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
}
