{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs; [
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
      theme = "gruvbox_light";
    };
  };
}
