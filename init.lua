-- Load my personal keymaps
require("rikas.keymaps")

-- Load my vim options
require("rikas.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy and all the plugins in the lua/plugins directory
require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    -- Accepts same border values as |nvim_open_win|
    border = "single",
  },
})

-- Colorscheme
vim.cmd.colorscheme("catppuccin")

-- Load misc configurations (not related to any particular package)
require("rikas.misc")

-- Autocomplete setup
require("rikas.cmp")

-- Custom hilight groups
require("rikas.highlights")

-- LSP configurations
require("rikas.lsp")

-- Terminal in floating window
require("rikas.floaterminal")
