-- You need to install the language server to use this config.
-- npm i -g vscode-langservers-extracted (or use Mason: json-lsp)

---@type vim.lsp.Config
return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
}
