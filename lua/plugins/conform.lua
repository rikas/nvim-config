require("conform").setup({
  formatters_by_ft = {
    javascript = { { "prettier", "bimome" } },
    typescript = { { "prettier", "biome" } },
    typescriptreact = { { "prettier", "biome" } },
    javascriptreact = { { "prettier", "biome" } },
    json = { { "prettier", "biome" } },
    html = { { "prettier", "biome" } },
    css = { { "prettier", "biome" } },
    scss = { { "prettier", "biome" } },
    markdown = { { "prettier", "biome" } },
    yaml = { { "prettier", "biome" } },
    lua = { "stylua" },
    ruby = { "rubocop" },
    graphql = { { "prettier", "biome" } },
    bash = { "shfmt" },
    sh = { "shfmt" },
    python = { "black" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})
