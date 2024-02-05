return { -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    -- Useful status updates for LSP
    "j-hui/fidget.nvim",
  },
}
