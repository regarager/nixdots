{inputs, ...}: {
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    colorschemes.gruvbox.enable = true;

    globals.mapleader = " ";

    opts = {
      mouse = "";
      autoindent = true;
      background = "dark";
      backspace = "indent,eol,start";
      clipboard = "unnamedplus";
      cursorline = true;
      expandtab = true;
      hlsearch = false;
      ignorecase = true;
      incsearch = true;
      linebreak = true;
      number = true;
      pumheight = 20;
      relativenumber = true;
      shiftwidth = 2;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      splitbelow = true;
      splitright = true;
      swapfile = false;
      tabstop = 2;
      termguicolors = true;
      winborder = "rounded";
      wrap = true;
    };

    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          ensure_installed = [
            "c"
            "cpp"
            "lua"
            "markdown"
            "nix"
            "python"
            "rust"
            "typst"
          ];
        };
      };

      blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "super-tab";
          snippets.preset = "luasnip";
          sources.default = ["lsp" "snippets" "path"];
        };
      };

      luasnip = {
        enable = true;
        fromLua = [
          {paths = "~/.config/nvim/lua/snippets";}
        ];
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            c = ["clang-format"];
            cpp = ["clang-format"];
            lua = ["stylua"];
            python = ["ruff_fix" "ruff_format" "ruff_organize_imports"];
            rust = ["rustfmt"];
            typst = ["typstyle"];
            "*" = ["trim_whitespace"];
          };
        };
      };

      oil = {
        enable = true;
        settings = {};
      };

      mini = {
        enable = true;
        modules = {
          extra = {};
          icons = {};
          move = {};
          pairs = {};
          pick = {
            window.config = {
              height = 8;
              width = 64;
            };
          };
        };
      };

      markview.enable = true;
      highlight-colors.enable = true;

      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
          pyright.enable = true;
          rust_analyzer.enable = true;
          rust_analyzer.installRustc = true;
          rust_analyzer.installCargo = true;
        };
      };
    };

    highlight = {
      LineNrAbove = {fg = "#7e9cd8";};
      LineNrBelow = {fg = "#e46876";};
      CursorLineNr = {
        fg = "#ebcb8b";
        bold = true;
      };
      BlinkCmpMenu = {link = "Normal";};
      BlinkCmpMenuBorder = {link = "Normal";};
      BlinkCmpMenuSelection = {link = "CursorLine";};
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
      }
      {
        mode = "n";
        key = "<leader>h";
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<leader>j";
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "<leader>k";
        action = "<C-w>k";
      }
      {
        mode = "n";
        key = "<leader>l";
        action = "<C-w>l";
      }
      {
        mode = "n";
        key = "<leader>sv";
        action = ":vsplit<CR>";
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = ":split<CR>";
      }
      {
        mode = "n";
        key = "F";
        action = ":lua require'conform'.format({ async = true })<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Oil<CR>";
      }
      {
        mode = "n";
        key = "ff";
        action = ":Pick files<CR>";
      }
      {
        mode = "n";
        key = "fg";
        action = ":Pick grep_live<CR>";
      }
      {
        mode = "n";
        key = ";";
        action = ":!";
      }
      {
        mode = "v";
        key = "<Tab>";
        action = ">gv";
      }
      {
        mode = "v";
        key = "<S-Tab>";
        action = "<gv";
      }
      {
        mode = "n";
        key = "<Tab>";
        action = ">>";
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<<";
      }
    ];

    extraConfigLua = ''
      -- <leader>t : open a vertical terminal
      vim.keymap.set("n", "<leader>t", function()
        vim.cmd("vnew")
        vim.cmd("term")
        vim.api.nvim_feedkeys("i", "n", false)
        vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { buffer = 0 })
      end, { silent = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          local ftypes = { "oil", "term" }
          if vim.tbl_contains(ftypes, vim.bo.filetype)
            or vim.api.nvim_buf_get_name(0) == "" then
            return
          end
          local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
          if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
          end
        end,
      })
    '';
  };
}
