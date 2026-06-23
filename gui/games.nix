{ config, pkgs, ...}:

with config; {
  home.packages = with pkgs; [
    olympus
    vvvvvv
    godot
    protonup-qt
    prismlauncher
  ];
}
