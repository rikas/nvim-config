require('bufferline').setup({
  options = {
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon'
    },
    close_command = function(n) require("mini.bufremove").delete(n, false) end,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    modified_icon = '●',

    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    separator_style = "thin",
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    offsets = {
      {
        filetype = "neo-tree",
        text_align = "left",
        separator = true,
        highlight = "BufferLineOffsetSeparator",
      },
    },
  },
})

-- Change the indicator color and the selected buffer text color
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { bg = 'NONE', fg = '#bbbbee' })
vim.api.nvim_set_hl(0, 'BufferLineBufferSelected',
  { bg = 'NONE', fg = '#e4e4ff', bold = false, italic = false, cterm = {} })
