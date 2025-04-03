---@type vim.lsp.Config
return {
  cmd = { "rubocop", "--lsp" },
  filetypes = { "ruby" },
  root_markers = {
    ".git",
    "Gemfile",
    "Rakefile",
    "config.ru",
    "app.rb",
    "config.ru",
    "Gemfile.lock",
  },
}

-- Old configuration just for reference
-- rubocop = function()
--   require("lspconfig").rubocop.setup({
--     mason = false,
--     cmd = { vim.fn.expand("~/.rbenv/shims/rubocop"), "--lsp" },
--   })
-- end,
