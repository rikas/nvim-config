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

vim.cmd('au CursorMoved * lua _G.cursorword_blocklist()')


return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require('mini.comment').setup()
    require('mini.bufremove').setup()
    require('mini.cursorword').setup({
      delay = 150
    })

    -- Change the default highlight groups for mini.cursorword
    vim.cmd('hi! link MiniCursorword Visual')
    vim.cmd('hi! link MiniCursorwordCurrent MiniCursorword')

    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.trailspace').setup()
  end
}
