return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {

    extensions = { "fugitive", "lazy", "trouble", "neo-tree", "mason" },
    options = {
      theme = "auto",
      icons_enabled = true,
      component_separators = { left = "󰿟", right = "󰿟" },
      section_separators = { left = "", right = "" },
    },

  },
}
