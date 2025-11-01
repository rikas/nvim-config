-- Load my personal keymaps
require("rikas.keymaps")

-- Load my vim options
require("rikas.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable", -- latest stable release
    lazyrepo,
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
        "tohtml",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "tar",
        "tarPlugin",
        "tutor",
        "rrhelper",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
  ui = {
    -- Adds a border to Lazy window. Accepts same border values as |nvim_open_win|
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
require("core.lsp")
