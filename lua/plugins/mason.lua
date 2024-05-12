return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "tsserver",
      "lua_ls",
      "eslint",
      "ruby_lsp",
      "prettierd",
      "rubocop",
    },
    ui = {
      border = "single",
    },
  },
}
