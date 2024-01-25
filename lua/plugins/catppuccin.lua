require("catppuccin").setup({
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
    },
  },
})
