return {
  "gbprod/yanky.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
  },

  config = function()
    require("yanky").setup({
      highlight = { timer = 250 },
      ring = { storage = "sqlite" },
    })

    -- Keymaps
    local telescopeyank = require("telescope").extensions.yank_history
    vim.keymap.set("n", "<leader>p", function()
      telescopeyank.yank_history({})
    end, { desc = "Open Yank History" })

    vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)", { desc = "Yank text" })
    vim.keymap.set(
      { "n", "x" },
      "p",
      "<Plug>(YankyPutAfter)",
      { desc = "Put yanked text after cursor" }
    )
    vim.keymap.set(
      { "n", "x" },
      "P",
      "<Plug>(YankyPutBefore)",
      { desc = "Put yanked text before cursor" }
    )
    vim.keymap.set(
      { "n", "x" },
      "gp",
      "<Plug>(YankyGPutAfter)",
      { desc = "Put yanked text after selection" }
    )
    vim.keymap.set(
      { "n", "x" },
      "gP",
      "<Plug>(YankyGPutBefore)",
      { desc = "Put yanked text before selection" }
    )
    vim.keymap.set(
      "n",
      "[y",
      "<Plug>(YankyCycleForward)",
      { desc = "Cycle forward through yank history" }
    )
    vim.keymap.set(
      "n",
      "]y",
      "<Plug>(YankyCycleBackward)",
      { desc = "Cycle backward through yank history" }
    )
    vim.keymap.set(
      "n",
      "]p",
      "<Plug>(YankyPutIndentAfterLinewise)",
      { desc = "Put indented after cursor (linewise)" }
    )
    vim.keymap.set(
      "n",
      "[p",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      { desc = "Put indented before cursor (linewise)" }
    )
    vim.keymap.set(
      "n",
      "]P",
      "<Plug>(YankyPutIndentAfterLinewise)",
      { desc = "Put indented after cursor (linewise)" }
    )
    vim.keymap.set(
      "n",
      "[P",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      { desc = "Put indented before cursor (linewise)" }
    )
    vim.keymap.set(
      "n",
      ">p",
      "<Plug>(YankyPutIndentAfterShiftRight)",
      { desc = "Put and indent right" }
    )
    vim.keymap.set(
      "n",
      "<p",
      "<Plug>(YankyPutIndentAfterShiftLeft)",
      { desc = "Put and indent left" }
    )
    vim.keymap.set(
      "n",
      ">P",
      "<Plug>(YankyPutIndentBeforeShiftRight)",
      { desc = "Put before and indent right" }
    )
    vim.keymap.set(
      "n",
      "<P",
      "<Plug>(YankyPutIndentBeforeShiftLeft)",
      { desc = "Put before and indent left" }
    )
    vim.keymap.set(
      "n",
      "=p",
      "<Plug>(YankyPutAfterFilter)",
      { desc = "Put after applying a filter" }
    )
    vim.keymap.set(
      "n",
      "=P",
      "<Plug>(YankyPutBeforeFilter)",
      { desc = "Put before applying a filter" }
    )
  end,
}
