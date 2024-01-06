return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Add file to harpoon",
    },
    {
      "<leader>h",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Toggle harpoon menu",
    },
    {
      "<C-n>",
      function()
        require("harpoon"):list():prev()
      end,
    },
    {
      "<C-m>",
      function()
        require("harpoon"):list():next()
      end,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
