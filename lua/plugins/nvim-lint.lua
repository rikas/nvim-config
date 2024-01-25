require("lint").lintes_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  javascriptreact = { "eslint" },
  lua = { "stylua" },
  ruby = { "rubocop" },
  sh = { "shellcheck" },
  vim = { "vint" },
  yaml = { "yamllint" },
  markdown = { "markdownlint" },
  json = { "jsonlint" },
  python = { "flake8" },
  go = { "golangci_lint" },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end,
})
