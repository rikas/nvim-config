-- Change the color of the color column
-- vim.cmd([[hi ColorColumn ctermbg=0 guibg=#25253b]])

-- Search highlight
-- default from catppuccin: xxx guifg=#cdd6f5 guibg=#3e5768
-- vim.cmd([[hi Search ctermbg=0 guibg=#428e64 guifg=#1e1e2f]])

-- Current search
-- default from catppuccin: xxx guifg=#181826 guibg=#f38ba9
-- vim.cmd([[hi CurSearch ctermbg=0 guibg=#66ff99 guifg=#30564a cterm=bold gui=bold]])

-- Change the default highlight groups for mini.cursorword
vim.cmd("hi! link MiniCursorword Visual")
vim.cmd("hi! link MiniCursorwordCurrent MiniCursorword")

-- Override the MiniIndentscopeSymbol highlight group
vim.cmd("hi! link MiniIndentscopeSymbol @type")
