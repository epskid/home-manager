{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # lsp
      nil
      zls
      pyright
      libclang
      tinymist
      jdt-language-server
      svelte-language-server
      haskell-language-server
    ];
    settings = {
      theme = "gruvbox_dark_soft_transparent";
      editor.cursor-shape.insert = "bar";
    };
    themes = {
      gruvbox_dark_soft_transparent = {
        inherits = "gruvbox_dark_soft";
        "ui.background" = "transparent";
      };
    };
  };
}
