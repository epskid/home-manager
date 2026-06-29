{ spicetifyPkgs, ... }:

{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicetifyPkgs.extensions; [
      adblockify
      hidePodcasts
      keyboardShortcut
    ];
  };
}
