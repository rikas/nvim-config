-- Disable having a new line as comment if coming from a comment line
vim.cmd([[autocmd FileType * set formatoptions-=cro]])

-- Add wrapping and spellcheck when editing markdown, text or git commits
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
--   pattern = { "gitcommit", "markdown", "txt" },
--   desc = "Enable spell checking and text wrapping for certain filetypes",
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spell = true
--     vim.opt_local.textwidth = 100
--   end,
-- })
--
-- Cool fold stuff
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 4

-- Diagnostics settings
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})
