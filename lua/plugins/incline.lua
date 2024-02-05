-- Name of the current buffer in the upper right corner
return {
  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
        local is_modified = vim.bo[props.buf].modified
        local modified = vim.bo[props.buf].modified and "bold,italic" or "none"

        local function get_diagnostic_label()
          local icons = { error = " ", warn = " ", info = " ", hint = " " }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(
              props.buf,
              { severity = vim.diagnostic.severity[string.upper(severity)] }
            )
            if n > 0 then
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { "┊ " })
          end
          return label
        end

        return {
          { get_diagnostic_label() },
          { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
          { filename .. " ", gui = modified },
          { (is_modified and "󰓏 " or ""), group = "DevIconCsv" },
          { "┊ " },
          { " " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
        }
      end,
    })
  end,
}
