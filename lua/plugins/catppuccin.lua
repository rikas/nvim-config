return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",

  opts = {
    term_colors = true,
    transparent_background = false,
    flavour = "mocha",
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
    },

    integrations = {
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      indent_blankline = true,
      harpoon = true,
      gitsigns = true,
      neotree = true,
      which_key = true,
      mason = true,
      mini = true,
      cmp = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
    },
  },
}
