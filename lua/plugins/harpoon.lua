return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():append()
    end, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon menu" })
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-m>", function()
      harpoon:list():next()
    end)
  end
}
