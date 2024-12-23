return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = true,
  config = function()
    require("oil").setup({
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      default_file_explorer = false,
    })

    -- Open parent directory in current window
    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent diretory" })

    -- Open parent directory in floating window
    vim.keymap.set(
      "n",
      "<leader>-",
      require("oil").toggle_float,
      { desc = "Open parent directory in floating window" }
    )
  end,
}
