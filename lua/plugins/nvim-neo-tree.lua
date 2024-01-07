return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          -- expander_highlight = "NeoTreeExpander",
          expander_highlight = "NeoTreeNormal",
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
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
            ["<space>"] = "none"
          }
        },
      },
    })
  end,
}
