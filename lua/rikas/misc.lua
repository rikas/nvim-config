-- Disable having a new line as comment if coming from a comment line
vim.cmd([[autocmd FileType * set formatoptions-=cro]])

-- Enable highlight when yanking
-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- vim.api.nvim_create_autocmd("TextYankPost", {
-- group = augroup("highlight_yank"),
-- callback = function()
-- vim.highlight.on_yank()
-- end,
-- })

-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "tutor",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
