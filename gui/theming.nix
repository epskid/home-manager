{ pkgs, ... }:

{
  home.packages = with pkgs; [
    papirus-icon-theme
    nerd-fonts.caskaydia-cove
  ];

  fonts.fontconfig.enable = true;
}
