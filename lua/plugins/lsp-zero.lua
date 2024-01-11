local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
    { buffer = bufnr, remap = false, desc = "Go to definition" })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
    { buffer = bufnr, remap = false, desc = "Information about symbol" })
  vim.keymap.set("n", "<leader>cs", function() vim.lsp.buf.workspace_symbol() end,
    { buffer = bufnr, remap = false, desc = "Search in workspace" })
  vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end,
    { buffer = bufnr, remap = false, desc = "Open diagnostics" })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
    { buffer = bufnr, remap = false, desc = "Next diagnostic" })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
    { buffer = bufnr, remap = false, desc = "Previous diagnostic" })
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
    { buffer = bufnr, remap = false, desc = "Code action" })
  vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end,
    { buffer = bufnr, remap = false, desc = "Code references" })
  vim.keymap.set("n", "<leader>cn", function() vim.lsp.buf.rename() end,
    { buffer = bufnr, remap = false, desc = "Rename" })
  vim.keymap.set("i", "<C-g>", function() vim.lsp.buf.signature_help() end,
    { buffer = bufnr, remap = false, desc = "Signature help" })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver", "lua_ls", "eslint", "ruby_ls"
  },
  handlers = {
    lsp_zero.default_setup,

    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,

    tsserver = function()
      require('lspconfig').tsserver.setup({})
    end,

    ruby_ls = function()
      require('lspconfig').ruby_ls.setup({})
    end,

    eslint = function()
      require("lspconfig").eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = "EslintFixAll"
          })
        end
      })
    end
  }
})

-- Autofomat on save
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
  end,
})
