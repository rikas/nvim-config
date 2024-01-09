require("telescope").setup({
  pickers = {
    find_files = {
      previewer = true,
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" },
    },
    buffers = {
      theme = "dropdown",
      previewer = true,
    },
    help_tags = {
      theme = "dropdown",
      previewer = true,
    },
    oldfiles = {
      previewer = true,
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" }
    },
    lsp_document_symbols = {
      previewer = true,
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" }
    },
    grep_string = {
      theme = "dropdown",
      previewer = true,
    },
  },
  extensions = {
    package_info = {
      theme = "cursor"
    }
  }
})

-- Extensions
require("telescope").load_extension("harpoon")
require("telescope").load_extension("package_info")

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", function() telescope.find_files() end, { desc = "Find file" })
vim.keymap.set("n", "<leader>fg", function() telescope.live_grep() end, { desc = "Grep in files" })
vim.keymap.set("n", "<leader>fb", function() telescope.buffers() end, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fh", function() telescope.help_tags() end, { desc = "Find help" })
vim.keymap.set("n", "<leader>fr", function() telescope.oldfiles() end, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>fs", function() telescope.lsp_document_symbols() end, { desc = "Find symbols" })
vim.keymap.set("n", "<leader>fw", function() telescope.grep_string() end, { desc = "Find word under cursor" })
