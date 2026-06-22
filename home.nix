{ config, pkgs, ... }:

{
  targets.genericLinux.enable = true;

  home.username = "jackblack";
  home.homeDirectory = "/home/jackblack";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    # cli
    neovim
    john
    stylua
    tree-sitter

    # gaming
    olympus
    vvvvvv
    godot
    protonup-qt
    prismlauncher

    # util
    aseprite
    cemu-ti
    tor-browser
    asunder
    obs-studio
    spotify

    # icons
    papirus-icon-theme

    # fonts
    nerd-fonts.caskaydia-cove
  ];

  fonts.fontconfig.enable = true;

  # terminal
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#32302f";
          foreground = "#ebdbb2";
        };
        bright = {
          black = "#928374";
          blue = "#83a598";
          cyan = "#8ec07c";
          green = "#b8bb26";
          magenta = "#d3869b";
          red = "#fb4934";
          white = "#fbf1c7";
          yellow = "#fabd2f";
        };
        normal = {
          black = "#3c3836";
          blue = "#458588";
          cyan = "#689d6a";
          green = "#98971a";
          magenta = "#b16286";
          red = "#cc241d";
          white = "#a89984";
          yellow = "#d79921";
        };
      };
      font = {
        size = 12;
        normal.family = "CaskaydiaCove Nerd Font";
      };
      window = {
        decorations = "None";
        dynamic_padding = true;
        padding = {
          x = 10;
          y = 10;
        };
        opacity = 0.9;
      };
    };
  };

  # cli tools
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

  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  # shell config
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "fish_vi_key_bindings";
    functions = {
      fish_greeting.body = "";
      fish_right_prompt.body = ''
        if test -n "$IN_NIX_SHELL"
          echo -n "(nix)"
        end
      '';
    };
    shellAliases = {
      ls = "eza";
      cat = "bat";
    };
  };

  # guis
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

  programs.home-manager.enable = true;
}
