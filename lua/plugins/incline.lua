return {
  "b0o/incline.nvim",
  dependencies = { "catppuccin/nvim" },
  priority = 1200,
  config = function()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { default = true, group = "NormalFloat" },
          InclineNormalNC = { default = true, group = "NormalFloat" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      hide = {
        cursorline = false,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local status = {}

        if vim.bo[props.buf].modified then
          status = { "[+] ", guifg = "#ffefaa" }
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return { { icon, guifg = color }, { " " }, { status }, { filename } }
      end,
    })
  end,
}
