{ pkgs, ... }:

{
  home.sessionVariables.MANPAGER = "nvim +Man!";

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # formatting
      stylua

      # lsp
      nil
      tinymist
    ];
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = [
      # qol
      pkgs.vimPlugins.vim-cool
      pkgs.vimPlugins.vim-sleuth
      ({
        plugin = pkgs.vimPlugins.mini-pick;
        config = ''
          require("mini.pick").setup()
          vim.keymap.set("n", "<leader>f", MiniPick.builtin.files)
          vim.keymap.set("n", "<leader>F", MiniPick.builtin.grep_live)
        '';
      })
      ({
        plugin = pkgs.vimPlugins.leap-nvim;
        config = ''
          vim.keymap.set("n", "s", "<Plug>(leap)")
          vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
        '';
      })

      # lsp
      ({
        plugin = pkgs.vimPlugins.nvim-lspconfig;
        config = ''
          vim.lsp.enable({
            "rust_analyzer",
            "clangd",
            "pyright",
            "nil_ls",
            "lua_ls",
            "svelte",
            "jdtls",
            "tinymist",
            "hls",
            "elixirls",
            "zls",
          })
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              vim.lsp.completion.enable(true, args.data.client_id, args.buf)

              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client then
                client.server_capabilities.semanticTokensProvider = nil
              end
            end,
          });
          vim.lsp.config("lua_ls", {
            settings = {
              Lua = {
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true)
                },
                diagnostics = {
                  disable = { "missing-fields" }
                }
              }
            }
          })
        '';
      })
      ({
        plugin = pkgs.vimPlugins.typst-preview-nvim;
        config = ''
          require("typst-preview").setup({
            open_cmd = "firefox %s -P typst-preview --class typst-preview",
            dependencies_bin = { ["tinymist"] = "tinymist" },
          })
          vim.keymap.set("n", "<leader>tp", vim.cmd.TypstPreview)
        '';
      })

      # colors
      pkgs.vimPlugins.transparent-nvim
      ({
        plugin = pkgs.vimPlugins.gruvbox-nvim;
        config = ''
          require("gruvbox").setup({
            contrast = "soft",
          })
          vim.cmd.colorscheme("gruvbox")
        '';
      })
      ({
        plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
        config = ''
          -- vim.api.nvim_create_autocmd("FileType", {
          --   pattern = { "*" },
          --   callback = function() vim.treesitter.start() end,
          -- })
        '';
      })
    ];
    initLua = ''
      vim.opt.showmode = false
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.winborder = "rounded"
      vim.opt.signcolumn = "yes"
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.mouse = ""
      vim.opt.cursorline = true
      vim.g.editorconfig = false

      vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
        pattern = { "*" },
        callback = function()
          if vim.opt.buftype:get() == "terminal" then
            vim.cmd(":startinsert")
          end
        end
      })

      vim.g.mapleader = " "
      vim.keymap.set("n", "<leader>`", "<Cmd>tab term<CR>")
      vim.keymap.set("n", "<leader>c", "1z=")
      vim.keymap.set("n", "<leader>=", vim.cmd.split)
      vim.keymap.set("n", "<leader>\\", vim.cmd.vsplit)
      vim.keymap.set("n", "<leader>e", vim.cmd.Explore)
      vim.keymap.set("n", "<leader>q", vim.cmd.bdelete)
      vim.keymap.set("n", "<leader>m", "<Cmd>make<CR>")
      vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
      vim.keymap.set("v", "<", "<gv")
      vim.keymap.set("v", ">", ">gv")
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
      vim.keymap.set("n", "<leader>M", function()
        local newBuf = vim.api.nvim_create_buf(false, false)
        vim.api.nvim_set_current_buf(newBuf)
        vim.fn.jobstart(vim.o.makeprg, { term = true, clear_env = false })
      end)
    '';
  };
}
