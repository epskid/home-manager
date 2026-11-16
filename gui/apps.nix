{
  pkgs,
  lib,
  ...
}:

let
  jackWrap =
    drv:
    pkgs.symlinkJoin {
      name = "${drv.name}-jackwrapped";
      paths = [ drv ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        ls "$out/bin"
        for b in "$out/bin/"*; do
          wrapProgram "$b" \
            --prefix LD_LIBRARY_PATH : "${pkgs.pipewire.jack}/lib"
        done
      '';
    };
in
{
  home.packages = with pkgs; [
    # 2d
    gimp
    aseprite

    # 3d
    blender

    # audio
    spotify
    asunder
    (jackWrap audacity_3)

    # general utility
    tor-browser
    obs-studio
  ];

  programs.vesktop = {
    enable = true;
    mutableSettings = true;
    settings = {
      arRPC = false;
      checkUpdates = false;
      customTitleBar = false;
      discordBranch = "stable";
      minimizeToTray = true;
      tray = true;
      hardwareAcceleration = true;
      hardwareVideoAcceleration = false;
      hardwareVideoEncoding = false;
      nativeTitleBar = true;
      staticTitle = false;
      enableMenu = false;
      enableShadow = true;
      enableRoundedCorners = true;
      enableSplashScreen = true;
      splashTheming = true;
      clickTrayToShowHide = false;
      disableMinSize = false;
      disableSmoothScroll = false;
      enableTaskbarFlashing = false;
      openLinksWithElectron = false;
      autoStartMinimized = false;
      splashPixelated = true;
      webRTCIPHandlingPolicy = "default";
      appBadge = true;
      transparencyOption = "none";
      splashColor = "rgb(235, 219, 178)";
      splashBackground = "rgb(50, 48, 47)";
    };
  };

  programs.obsidian.enable = true;

  xdg.desktopEntries = {
    cemu = {
      categories = [
        "Education"
        "Utility"
      ];
      exec = "${lib.getExe pkgs.cemu-ti}";
      genericName = "Calculator";
      name = "CEmu";
      terminal = false;
      icon = "gnome-calculator";
    };
  };
}
