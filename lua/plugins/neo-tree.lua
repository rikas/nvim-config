return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true,
    enable_diagnostic = true,
    buffers = {
      follow_current_file = {
        enabled = true,
      },
      window = {
        mappings = {
          -- open with l key
          ["l"] = "open",
          -- space is my leader
          ["<space>"] = "none",
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          -- open with l key
          ["l"] = "open",
          -- space is my leader
          ["<space>"] = "none",
        },
      },
    },
    default_component_configs = {
      modified = {
        symbol = "",
        highlight = "DevIconCsv",
      },
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
    filesystem = {
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignore = true,
        hide_by_name = {
          "node_modules",
          "build",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
      window = {
        mappings = {
          -- open with l key
          ["l"] = "open",
          -- space is my leader
          ["<space>"] = "none",
        },
      },
    },
  },

  config = function(_, opts)
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup(opts)

    -- Toggle neo tree
    vim.keymap.set("n", "<leader>ee", function()
      require("neo-tree.command").execute({ toggle = true })
    end, { desc = "Toggle file explorer (NeoTree)" })

    -- Show only open buffers
    vim.keymap.set("n", "<leader>eb", function()
      require("neo-tree.command").execute({ source = "buffers", toggle = true })
    end, { desc = "Toggle open buffers (NeoTree)" })

    -- Show git status
    vim.keymap.set("n", "<leader>eg", function()
      require("neo-tree.command").execute({ source = "git_status", toggle = true })
    end, { desc = "Toggle git status (NeoTree)" })
  end,
}
