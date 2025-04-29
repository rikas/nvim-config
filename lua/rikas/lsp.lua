-- This is where you enable features that only work if there is a language server active in the
-- file
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    -- Helper function to merge options with a description
    local function with_desc(desc)
      return vim.tbl_extend("force", {}, opts, { desc = desc })
    end

    vim.keymap.set(
      "n",
      "gd",
      "<cmd>lua vim.lsp.buf.definition()<cr>",
      with_desc("[LSP] Show definitions")
    )
    vim.keymap.set(
      "n",
      "gD",
      "<cmd>lua vim.lsp.buf.declaration()<cr>",
      with_desc("[LSP] Show declarations")
    )
    vim.keymap.set(
      "n",
      "<leader>ci",
      "<cmd>lua vim.lsp.buf.implementation()<cr>",
      with_desc("[LSP] Show implementations")
    )
    vim.keymap.set(
      "n",
      "go",
      "<cmd>lua vim.lsp.buf.type_definition()<cr>",
      with_desc("[LSP] Show type definitions")
    )
    vim.keymap.set(
      "n",
      "<leader>cr",
      "<cmd>lua vim.lsp.buf.references()<cr>",
      with_desc("[LSP] Show references")
    )
    vim.keymap.set(
      "i",
      "<C-K>",
      "<cmd>lua vim.lsp.buf.signature_help({ border = 'rounded' })<cr>",
      with_desc("[LSP] Show signature help")
    )
    vim.keymap.set(
      "n",
      "<leader>cn",
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      with_desc("[LSP] Rename symbol")
    )
    vim.keymap.set(
      "n",
      "<leader>ca",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      with_desc("[LSP] Code action")
    )
    vim.keymap.set(
      { "n", "x" },
      "<leader>cf",
      "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
      with_desc("[LSP] Format code")
    )
  end,
})

-- Diganostics are not exclusive to LSP servers so these can be global keybings
vim.keymap.set(
  "n",
  "<leader>cd",
  "<cmd>lua vim.diagnostic.open_float()<cr>",
  { desc = "Open diagnostics" }
)
