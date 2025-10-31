vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.opt.cursorline = true -- Enable highlighting of the current line

-- Show line numbers and set them to relative
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.showmode = false -- Do not show mode in the command line since we have lualine
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.list = true -- Show some invisible characters (tabs, etc)
vim.opt.smartindent = false -- neovim smart indentation
vim.opt.wrap = false -- do not wrap long lines

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- If this many ms nothing is typed the swap file will be written to disk
vim.opt.updatetime = 250

-- How much time neovim will wait for a mapped sequence to complete
vim.opt.timeoutlen = 250

-- Ignore these files when expanding wildcards
vim.opt.wildignore:append({ "node_modules/**", "dist/**", "build/**" })

-- Add a color column at the 100th column
vim.opt.colorcolumn = { 100 }

-- Use ripgrep instead of grep for faster grepping
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Set default window border of all floating windows
vim.opt.winborder = "rounded"

-- Set the sign column to always be visible
vim.opt.signcolumn = "yes"
