{ ... }:

{
  programs.zellij = {
    enable = true;

    # kdl in nix 🫩

    settings = {
      theme = "gruvbox-dark";
      mouse_mode = false;
      show_startup_tips = false;
      pane_frames = false;
      keybinds = {
        normal._children = [
          {
            bind = {
              _args = [ "Ctrl `" ];
              _children = [
                { NewPane._args = [ "Down" ]; }
                { Resize._args = [ "Decrease" ]; }
              ];
            };
          }
          {
            bind = {
              _args = [ "Alt g" ];
              _children = [
                {
                  Run = {
                    _args = [ "lazygit" ];
                    _children = [
                      { close_on_exit = true; }
                      { floating = true; }
                      { pinned = true; }
                      { name = "git =("; }
                      { x = "5%"; }
                      { y = "5%"; }
                      { width = "90%"; }
                      { height = "90%"; }
                    ];
                  };
                }
              ];
            };
          }
        ];
      };
    };
    layouts = {
      default.layout._children = [
        {
          default_tab_template._children = [
            {
              pane = {
                borderless = true;
                plugin = {
                  location = "zellij:tab-bar";
                };
                size = 1;
              };
            }
            {
              children = { };
            }
            {
              pane = {
                borderless = true;
                plugin = {
                  location = "zellij:status-bar";
                };
                size = 1;
              };
            }
          ];
        }
        {
          tab = {
            _children = [
              {
                pane = {
                  command = "hx";
                  args = ".";
                  _props = {
                    focus = true;
                    close_on_exit = true;
                  };
                };
              }
            ];
            _props = {
              name = "helix";
              focus = true;
              split_direction = "horizontal";
            };
          };
        }
      ];
    };
  };
}
