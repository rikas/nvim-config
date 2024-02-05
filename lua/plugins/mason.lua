return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "tsserver",
      "lua_ls",
      "eslint",
      "ruby_ls",
    },
    ui = {
      border = "single",
    },
  },
}
