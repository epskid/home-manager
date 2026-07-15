{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Gruvbox Dark Soft";
      font-size = 12;
      font-family = "CaskaydiaCove Nerd Font";
      background-opacity = 0.9;
      window-decoration = "none";
      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;

      env = "TERM=xterm-256color";
      working-directory = "home";
      window-inherit-working-directory = false;
      quit-after-last-window-closed = false;
    };
    themes = {
      "Gruvbox Dark Soft" = {
        background = "32302f";
        foreground = "ebdbb2";
        cursor-color = "ebdbb2";
        palette = [
          "0=#3c3836"
          "1=#cc241d"
          "2=#98971a"
          "3=#d79921"
          "4=#458588"
          "5=#b16286"
          "6=#689d6a"
          "7=#a89984"
          "8=#928374"
          "9=#fb4934"
          "10=#b8bb26"
          "11=#fabd2f"
          "12=#83a598"
          "13=#d3869b"
          "14=#8ec07c"
          "15=#fbf1c7"
        ];
        selection-foreground = "32302f";
        selection-background = "ebdbb2";
      };
    };
  };
}
