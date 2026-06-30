{
  pkgs,
  insecure,
  spicetifyPkgs,
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
    krita
    aseprite

    # 3d
    blender

    # audio
    asunder
    lmms-full
    (jackWrap audacity)

    # emulators
    cemu-ti

    # general utility
    tor-browser
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
