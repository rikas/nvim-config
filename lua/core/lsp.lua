-- -- Enable lsp completion (what does this do? maybe i don't need it because of cmp?)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
  end,
})

-- Enable configured language servers
-- server configurations are in lsp/*.lua and included automatically
vim.lsp.enable({
  "cssls",
  "eslint",
  "html",
  "json",
  "lua_ls",
  "rubocop",
  "ruby_lsp",
  "tailwindcss",
  "ts_ls",
})

-- Allow virtual text for diagnostics and show floating window on jump
vim.diagnostic.config({
  virtual_text = true,
  jump = { float = true },
})
