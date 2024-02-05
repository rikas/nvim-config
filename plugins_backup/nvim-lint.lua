local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  sh = { "shellcheck" },
  vim = { "vint" },
  yaml = { "yamllint" },
  markdown = { "markdownlint" },
  json = { "jsonlint" },
}

lint.linters = {
  -- Custom configuration to avoid errors when eslint is not available
  eslint_d = {
    args = {
      "--no-warn-ignored",
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    },
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    lint.try_lint(nil, { ignore_errors = true })
  end,
})

-- Add key map to run try_lint
vim.keymap.set("n", "<leader>el", function()
  lint.try_lint()
end, { desc = "Lint current buffer" })
