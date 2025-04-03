-- You need to install the language server to use this config.
-- npm i -g vscode-html-languageservice (or use Mason: html-lsp)

---@type vim.lsp.Config
return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ" },
}
