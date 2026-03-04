---@type vim.lsp.Config
return {
  cmd = { "rbenv", "exec", "ruby-lsp" },
  filetypes = { "ruby", "eruby" },
  root_markers = {
    "Gemfile",
    "Rakefile",
    "config.ru",
    "app.rb",
  },
  single_file_support = false,
}
