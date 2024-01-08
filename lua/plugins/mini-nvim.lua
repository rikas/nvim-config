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

-- Key mappings for mini.surround
require("mini.surround").setup({
  mappings = {
    add = "gsa",            -- add surrounding in Normal and Visual modes
    delete = "gsd",         -- delete surrounding
    find = "gsf",           -- find surrounding (to the right)
    find_left = "gsF",      -- find surrounding (to the left)
    highlight = "gsh",      -- highlight surrounding
    replace = "gsr",        -- replace surrounding
    update_n_lines = "gsn", -- update surrounding for n lines
  }
})

-- Use ts_context_commentstring for mini.comment
require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end
  }
})
