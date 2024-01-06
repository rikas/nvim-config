vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.opt.cursorline = true -- Enable highlighting of the current line

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2   -- Size of an indent
vim.opt.showmode = false -- Do not show mode in the command line since we have lualine
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.list = true      -- Show some invisible characters (tabs, etc)

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- If this many ms nothing is typed the swap file will be written to disk
vim.opt.updatetime = 50

-- Prevent neovim commenting out next line after a comment line
vim.opt.formatoptions:remove({ "r", "o" })

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
