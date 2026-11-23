{ pkgs, ... }:

{
  home.packages = with pkgs; [
    papirus-icon-theme
    nerd-fonts.caskaydia-cove
  ];

  home.pointerCursor = {
    enable = true;
    x11.enable = true;
    sway.enable = true;
    gtk.enable = true;
    dotIcons.enable = true;
    name = "Maple";
    package = pkgs.maplestory-cursor;
  };

  fonts.fontconfig.enable = true;
}
