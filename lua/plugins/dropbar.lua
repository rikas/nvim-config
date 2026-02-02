return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  config = function()
    local dropbar_api = require("dropbar.api")
    vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Dropbar: Pick" })
    vim.keymap.set(
      "n",
      "<Leader>[;",
      dropbar_api.goto_context_start,
      { desc = "Dropbar: Go to start of context" }
    )
    vim.keymap.set(
      "n",
      "<Leader>];",
      dropbar_api.select_next_context,
      { desc = "Dropbar: Select next context" }
    )
  end,
}
