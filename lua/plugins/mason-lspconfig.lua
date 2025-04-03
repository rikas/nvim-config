return {
  enabled = false,
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "ts_ls",
      "lua_ls",
      "eslint",
      "ruby_lsp",
      "prettierd",
      "rubocop",
      "yamlfix",
    },
  },
}
