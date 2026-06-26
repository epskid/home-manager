{ config, pkgs, ... }:

with config; {
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
    interactiveShellInit = ''
      fish_vi_key_bindings
      fish_add_path ~/.cargo/bin/
    '';
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

  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };
}
