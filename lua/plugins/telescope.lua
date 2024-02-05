return {
  { -- Use native fzf (fzf needs to be installed on the system)
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
  },
  { -- Fuzzy finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim"
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
            },
          },
        },

        pickers = {
          find_files = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          buffers = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          help_tags = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          oldfiles = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          lsp_document_symbols = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          grep_string = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
        },
        extensions = {
          package_info = {
            theme = "cursor",
          },
        },
      })

      -- Extensions
      require("telescope").load_extension("harpoon")
      require("telescope").load_extension("package_info")
      require("telescope").load_extension("fzf")

      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", function()
        telescope.find_files()
      end, { desc = "Find file" })

      vim.keymap.set("n", "<leader>fg", function()
        telescope.live_grep()
      end, { desc = "Grep in files" })

      vim.keymap.set("n", "<leader>fb", function()
        telescope.buffers()
      end, { desc = "Find buffer" })

      vim.keymap.set("n", "<leader>fh", function()
        telescope.help_tags()
      end, { desc = "Find help" })

      vim.keymap.set("n", "<leader>fr", function()
        telescope.oldfiles()
      end, { desc = "Find recent files" })

      vim.keymap.set("n", "<leader>fs", function()
        telescope.lsp_document_symbols()
      end, { desc = "Find symbols" })

      vim.keymap.set("n", "<leader>fw", function()
        telescope.grep_string()
      end, { desc = "Find word under cursor" })

      vim.keymap.set("n", "<leader>fd", function()
        telescope.diagnostics({ severity_bound = 0 })
      end, { desc = "Find diagnostics" })
    end,
  },
}
