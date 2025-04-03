---@type vim.lsp.Config
return {
  cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
  filetypes = { "ruby", "eruby" },
  root_markers = {
    ".git",
    "Gemfile",
    "Rakefile",
    "config.ru",
    "app.rb",
    "config.ru",
    "Gemfile.lock",
  },
  single_file_support = true,
}

-- Old configuration just for reference
-- ruby_lsp = function()
--   require("lspconfig").ruby_lsp.setup({
--     mason = false,
--     cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
--   })
-- end,
