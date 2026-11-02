{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # languages
    zig
    ghc
    typst

    # skid stuff
    htop
    john
    yt-dlp
  ];

  # package managers
  programs.uv.enable = true;
  programs.bun.enable = true;

  # general utility
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "the man of the hour";
        email = "him@localhost";
      };
    };
  };

  programs.fd.enable = true;

  programs.ripgrep.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      italic-text = "always";
    };
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    enableFishIntegration = true;
  };

  # apps
  programs.spotify-player = {
    enable = true;
  };
}
