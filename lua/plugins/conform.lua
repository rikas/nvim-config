return {
  "stevearc/conform.nvim",
  opts = {
    event = { "BufReadPre", "BufNewFile" },
    formatters_by_ft = {
      javascript = { "prettierd", lsp_format = "fallback" },
      typescript = { "prettierd", lsp_format = "fallback" },
      typescriptreact = { "prettierd", lsp_format = "fallback" },
      javascriptreact = { "prettierd", lsp_format = "fallback" },
      json = { "prettierd", lsp_format = "fallback" },
      html = { "prettierd", lsp_format = "fallback" },
      css = { "prettierd", lsp_format = "fallback" },
      scss = { "prettierd", lsp_format = "fallback" },
      markdown = { "prettierd" },
      yaml = { "yamlfix" },
      lua = { "stylua" },
      bash = { "shfmt" },
      sh = { "shfmt" },
      python = { "black" },
      graphql = { "prettierd" },
      eruby = { "erb_format", lstp_format = "fallback" },
    },

    formatters = {
      yamlfix = {
        env = {
          YAMLFIX_SEQUENCE_STYLE = "block_style",
          YAMLFIX_SECTION_WHITELINES = "1",
          YAMLFIX_LINE_LENGTH = "100",
          YAMLFIX_preserve_quotes = "true",
        },
      },
    },

    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  },
}
