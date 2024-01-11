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

-- Keymaps
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr> ", { desc = "Delete other buffers" })
vim.keymap.set("n", "<leader>bd", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete buffer right" })
vim.keymap.set("n", "<leader>be", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete buffer left" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

-- Delete buffer by moving to the next buffer first and then deleting the buffer
vim.keymap.set("n", "<leader>bq", function()
    vim.cmd("BufferLineCycleNext")
    vim.cmd(":bd#")
  end,
  { desc = "Delete buffer" })
