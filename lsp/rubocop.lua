---@type vim.lsp.Config
return {
  cmd = { vim.fn.expand("~/.rbend/shims/rubocop"), "--lsp" },
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
