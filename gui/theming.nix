{ pkgs, ... }:

{
  home.packages = with pkgs; [
    papirus-icon-theme
    nerd-fonts.caskaydia-cove
  ];

  gtk.enable = true;

  home.pointerCursor = {
    enable = true;
    x11.enable = true;
    sway.enable = true;
    gtk.enable = true;
    dotIcons.enable = true;
    name = "Vanilla-DMZ-AA";
    package = pkgs.vanilla-dmz;
    size = 24;
  };

  fonts.fontconfig.enable = true;
}
