{ inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";
    globals.maplocalleader = " ";

    opts = {
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
        integrations = {
          cmp = true;
          nvimtree = true;
          gitsigns = true;
          treesitter = true;
          telescope.enabled = true;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>gf";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        options = {
          desc = "Format Buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
        options.desc = "Toggle Nvim Tree";
      }
      {
        mode = "n";
        key = "<leader>f";
        action = ":NvimTreeFocus<CR>";
        options.desc = "Focus NvimTree";
      }
      {
        mode = "n";
        key = "<leader>nf";
        action = ":NvimTreeFindFile<CR>";
        options.desc = "Find current file in tree";
      }
      {
        mode = "n";
        key = "<leader>nc";
        action = ":NvimTreeCollapse<CR>";
        options.desc = "Collapse NvimTree nodes";
      }
    ];

    plugins.lsp = {
      enable = true;
      servers = {
        gopls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        nixd.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        K = "hover";
        "<leader>rn" = "rename";
      };
    };

    plugins.none-ls = {
      enable = true;
      sources = {
        formatting = {
          nixpkgs_fmt.enable = true;
          black.enable = true;
          gofmt.enable = true;
          clang_format.enable = true;
        };
      };
    };

    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };
      };
    };

    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
      };
    };


    plugins.nvim-tree = {
      enable = true;
      git = {
        enable = true;
        ignore = false; 
        showOnDirs = true; 
        timeout = 400; 
      };
      renderer.icons.show.git = true; 
    };

    plugins.tmux-navigator.enable = true;
    plugins.autoclose.enable = true;
    plugins.comfy-line-numbers.enable = true;
    plugins.treesitter.enable = true;
    plugins.direnv.enable = true;
    plugins.lualine.enable = true;
  };

}
