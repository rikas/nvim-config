_G.cursorword_blocklist = function()
  local curword = vim.fn.expand('<cword>')
  local filetype = vim.bo.filetype

  -- Disable for neo-tree
  if filetype == 'neo-tree' then
    vim.b.minicursorword_disable = true
    return
  end

  -- Add any disabling global or filetype-specific logic here
  local blocklist = {}
  if filetype == 'lua' then
    blocklist = { 'return', 'local', 'require', 'function' }
  elseif filetype == 'javascript' or filetype == 'typescript' or filetype == 'typescriptreact' then
    blocklist = { 'import', 'const', 'let' }
  end

  vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
end

-- Do not highlight based on the function above
vim.cmd('au CursorMoved * lua _G.cursorword_blocklist()')

-- Change the default highlight groups for mini.cursorword
vim.cmd('hi! link MiniCursorword Visual')
vim.cmd('hi! link MiniCursorwordCurrent MiniCursorword')
