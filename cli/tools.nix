{ config, pkgs, ... }:

with config; {
  home.packages = with pkgs; [
    # languages
    zig
    ghc
    haskell-language-server
    typst

    # neovim stuff
    neovim
    stylua
    tree-sitter

    # skid stuff
    john
  ];

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
}
