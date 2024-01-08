require("catppuccin").setup({
  term_colors = true,
  transparent_background = false,

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

  color_overrides = {
    mocha = {
      base = "#111111",
      mantle = "#111111",
      crust = "#111111",
    },
  },

  integrations = {
    indent_blankline = { enabled = true },
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    neotree = true,
    which_key = true,
    mason = true,
    mini = true,
    cmp = true,
    telescope = {
      enabled = true,
      style = "minimal",
    },
  }
})
