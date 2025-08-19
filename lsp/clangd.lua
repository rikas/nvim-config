-- You need to install the language server to use this config.
-- use Mason: clangd

---@type vim.lsp.Config
return {
  cmd = {
    -- vim.fn.expand("~/.local/share/nvim/mason/bin/clangd"),
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  filetypes = { "cpp", "c", "objc", "objcpp", "cuda", "proto", "hpp" },
  root_markers = { ".git" },
}
