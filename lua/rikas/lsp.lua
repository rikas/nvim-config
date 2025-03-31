-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  "force",
  lspconfig_defaults.capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "lua_ls",
    "eslint",
    "ruby_lsp",
    "tailwindcss",
  },

  handlers = {
    tailwindcss = function()
      require("lspconfig").tailwindcss.setup({
        settings = {
          tailwindCSS = {
            validate = true,
            classAttributes = { "class", "className", ".*Classes.*" },
            experimental = {
              classRegex = {
                { "(?:twMerge|twJoin|tv)\\(([^\\);]*)[\\);]", "[`'\"]([^'\"`,;]*)[`'\"]" },
              },
            },
          },
        },
      })
    end,

    lua_ls = function()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,

    ts_ls = function()
      require("lspconfig").ts_ls.setup({
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      })
    end,

    eslint = function()
      require("lspconfig").eslint.setup({})
    end,

    jsonls = function()
      require("lspconfig").jsonls.setup({})
    end,

    cssls = function()
      require("lspconfig").cssls.setup({})
    end,

    ruby_lsp = function()
      require("lspconfig").ruby_lsp.setup({
        mason = false,
        cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
      })
    end,

    rubocop = function()
      require("lspconfig").rubocop.setup({
        mason = false,
        cmd = { vim.fn.expand("~/.rbenv/shims/rubocop"), "--lsp" },
      })
    end,
  },
})

vim.opt.signcolumn = "yes"

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
      "K",
      "<cmd>lua vim.lsp.buf.hover()<cr>",
      with_desc("[LSP] Show hover information")
    )
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
      "<cmd>lua vim.lsp.buf.signature_help()<cr>",
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

-- Diganostics are not exclusive to LSP servers so these can be flobal keybings
vim.keymap.set(
  "n",
  "<leader>cd",
  "<cmd>lua vim.diagnostic.open_float()<cr>",
  { desc = "Open diagnostics" }
)
