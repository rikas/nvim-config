return { -- Show indent lines
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    -- Indentation guides with the same color as the highlight group `LineNr`
    indent = { char = "▏", highlight = { "IblIndent" } },

    -- When in the scope highlight with the same color as the highlight group `@keyword`
    -- scope = {
    --   highlight = { "CursorLineNr" },
    --   exclude = { language = { "json", "jsonc" } },
    -- },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
