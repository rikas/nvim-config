require('bufferline').setup({
  options = {
    icon = '|', -- this should be omitted if indicator style is not 'icon'
    style = 'icon',
    close_command = function(n) require("mini.bufremove").delete(n, false) end,
    diagnostics = "nvim_lsp",
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
