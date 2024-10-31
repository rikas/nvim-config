return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "ts_ls",
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
