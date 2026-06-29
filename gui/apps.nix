{ pkgs, insecure, spicetifyPkgs, ... }:

{
  home.packages = with pkgs; [
    aseprite
    cemu-ti
    tor-browser
    asunder
    obs-studio
  ];

  programs.vesktop = {
    enable = true;
    package = insecure.vesktop;
    settings = {
      arRPC = false;
      checkUpdates = false;
      minimizeToTray = true;
      tray = true;
      customTitleBar = false;
      discordBranch = "stable";
    };
  };

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicetifyPkgs.extensions; [
      adblockify
      hidePodcasts
      keyboardShortcut
    ];
  };

  programs.obsidian.enable = true;
}
