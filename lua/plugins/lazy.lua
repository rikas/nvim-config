local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "tpope/vim-sensible" },
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "fladson/vim-kitty" },
    { "ThePrimeagen/harpoon",      branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

    { -- LSP Configuration & Plugins
      "neovim/nvim-lspconfig",
      dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Useful status updates for LSP
        "j-hui/fidget.nvim",
      }
    },

    { -- Copilot
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      event = "InsertEnter",
    },

    { -- Autocompletion
      "hrsh7th/nvim-cmp",
      dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    },

    { --VSCode style icons to use in cmp menu
      "onsails/lspkind.nvim"
    },

    { -- Sidebar with file tree
      "nvim-neo-tree/neo-tree.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" }
    },

    { -- Color scheme
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      opts = {}
    },

    { -- Name of the current buffer in the upper right corner
      "b0o/incline.nvim",
      priority = 1200,
      dependencies = { "catppuccin/nvim" }
    },

    { -- Status line
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {}
    },

    { -- A set of small packages with common features
      "echasnovski/mini.nvim",
      config = function()
        require('mini.comment').setup()
        require('mini.bufremove').setup()
        require('mini.cursorword').setup({
          delay = 150
        })
        require('mini.pairs').setup()
        require('mini.surround').setup()
        require('mini.trailspace').setup()
      end
    },

    { -- Colorize color strings like "#ff5511" or "blue"
      "NvChad/nvim-colorizer.lua",
    },

    { -- Show indent lines
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
    },
    { -- Fuzzy finder (files, lsp, etc)
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    { 'nvim-telescope/telescope-symbols.nvim' },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

    { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      build = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      }
    },

    { -- Smarter comments using treesitter
      "JoosepAlviste/nvim-ts-context-commentstring",
      lazy = true,
      opts = {
        enable_autocmd = false,
      },
    },

    {
      "folke/which-key.nvim",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
      end,
      opts = {}
    }
  },
  {
    ui = {
      -- Accepts same border values as |nvim_open_win|
      border = "single"
    }
  })
