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
      "nvim-telescope/telescope-symbols.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope.telescope")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["C-q"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
          cache_picker = {
            num_pickers = 100,
            ignore_empty_prompt = true,
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
      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Find buffer" })
      vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Find help" })
      vim.keymap.set("n", "<leader>fr", telescope.oldfiles, { desc = "Find recent files" })
      vim.keymap.set("n", "<leader>fw", telescope.grep_string, { desc = "Find word under cursor" })
      vim.keymap.set("n", "<leader>fl", telescope.resume, { desc = "Resume last find" })
      vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Find in files (grep)" })
      vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols, { desc = "Find symbols" })
    end,
  },
}
