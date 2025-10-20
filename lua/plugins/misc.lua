return {
  { "tpope/vim-sensible" }, -- some defaults that tpope thinks are sensible
  { "tpope/vim-repeat" }, -- make the . work a little bit better
  { "kylechui/nvim-surround", opts = {} }, -- add/remove things surrounding text (newer plugin)
  { "tpope/vim-bundler" }, -- bundler goodies (:Bundle, :Bundle open)
  { "folke/neodev.nvim" }, -- Neovim setup for init.lua and plugin development
  { -- Highlight f t F T
    "gukz/ftFT.nvim",
    opts = {
      keys = { "f", "t", "F", "T" },
      hl_group = "SpellRare",
    },
    config = true,
  },
}
