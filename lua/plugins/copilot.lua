return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = false,
      auto_refresh = true,
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      accept = false, -- disable built-in keymapping
    },
  },
  init = function()
    -- Add a slightly different highlight for copilot suggestions
    vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#7e858c" })

    -- Hide copilot suggestions when cmp menu is open to prevent odd behavior/garbled up suggestions
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if cmp_status_ok then
      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end
  end,
}
