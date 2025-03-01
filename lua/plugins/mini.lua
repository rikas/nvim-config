_G.cursorword_blocklist = function()
  local curword = vim.fn.expand("<cword>")
  local filetype = vim.bo.filetype

  -- Disable for neo-tree
  if filetype == "neo-tree" then
    vim.b.minicursorword_disable = true
    return
  end

  -- Add any disabling global or filetype-specific logic here
  local blocklist = {}
  if filetype == "lua" then
    blocklist = { "local", "require" }
  elseif filetype == "javascript" then
    blocklist = { "import" }
  end

  vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
end

return { -- A set of small packages with common features
  "echasnovski/mini.nvim",
  version = false,

  config = function()
    require("mini.bufremove").setup()
    -- Show matching words like the one under the cursor
    require("mini.cursorword").setup({
      delay = 150,
    })
    require("mini.pairs").setup()
    require("mini.trailspace").setup()
    require("mini.splitjoin").setup()
    require("mini.ai").setup()

    -- Do not highlight based on the function above
    vim.cmd("au CursorMoved * lua _G.cursorword_blocklist()")

    -- Use ts_context_commentstring for mini.comment
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    })

    -- require("mini.indentscope").setup({
    --   draw = {
    --     delay = 0,
    --     animation = require("mini.indentscope").gen_animation.none(),
    --   },
    --   options = {
    --     indent_at_cursor = true,
    --   },
    --   symbol = "▏",
    -- })
  end,
}
