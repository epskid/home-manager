{ config, pkgs, ... }:

with config; {
  home.packages = with pkgs; [
    aseprite
    cemu-ti
    tor-browser
    asunder
    obs-studio
    spotify
  ];

  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = false;
      checkUpdates = false;
      minimizeToTray = true;
      tray = true;
      customTitleBar = false;
      discordBranch = "stable";
    };
  };

  programs.obsidian.enable = true;
}
