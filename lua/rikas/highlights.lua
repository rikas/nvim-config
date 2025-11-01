-- Change the default highlight groups for mini.cursorword
vim.cmd("hi! link MiniCursorword BlinkCmpMenuSelection")
vim.cmd("hi! link MiniCursorwordCurrent MiniCursorword")

-- Override the MiniIndentscopeSymbol highlight group
vim.cmd("hi! link MiniIndentscopeSymbol @type")
