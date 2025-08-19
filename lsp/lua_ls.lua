---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        disable = { "lowercase-global" },
        needFileStatus = {
          ["codestyle-checl"] = "Any",
          ["type-check"] = "Opened",
          ["strict"] = "Any",
        },
      },
      type = {
        castNumberToInteger = false,
        weakUnionCheck = true,
        checkTableShape = true,
        inferParamType = true,
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/love2d/library",
        },
      },
    },
  },
}
