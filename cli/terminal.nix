{ ... }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "CaskaydiaCove Nerd Font:size=12";
        term = "xterm-256color";
        pad = "10x10 center";
      };
      colors-dark = {
        alpha = "0.9";
        background = "32302f";
        foreground = "ebdbb2";
        regular0 = "3c3836";
        regular1 = "cc241d";
        regular2 = "98971a";
        regular3 = "d79921";
        regular4 = "458588";
        regular5 = "b16286";
        regular6 = "689d6a";
        regular7 = "a89984";
        bright0 = "928374";
        bright1 = "fb4934";
        bright2 = "b8bb26";
        bright3 = "fabd2f";
        bright4 = "83a598";
        bright5 = "d3869b";
        bright6 = "8ec07c";
        bright7 = "fbf1c7";
      };
      csd.preferred = "none";
    };
  };
}
