return {
  { "tpope/vim-sensible" }, -- some defaults that tpope thinkgs are sensible
  { "tpope/vim-repeat" }, -- make the . work a little bit better
  { "kylechui/nvim-surround", opts = {} }, -- add/remove things surrounding text (newer plugin)
  { "tpope/vim-bundler" }, -- bundler goodies (:Bundle, :Bundle open)
  { "fladson/vim-kitty" }, -- kitti.conf syntax highlighting
  { "folke/neodev.nvim" }, -- Neovim setup for init.lua and plugin development
  { -- Highlight f t F T
    "gukz/ftFT.nvim",
    opts = {
      keys = { "f", "t", "F", "T" },
      hl_group = "SpellRare",
    },
    config = true,
  },
  { -- Colorize color strings like "#ff5511" or "blue"
    "NvChad/nvim-colorizer.lua",
  },
}
