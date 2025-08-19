-- return {
--   enabled = false, -- this plugin was messing with markdown preview on function signatures etc
--   "MeanderingProgrammer/markdown.nvim",
--   name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
--   dependencies = { "nvim-treesitter/nvim-treesitter" },
--   config = function()
--     require("render-markdown").setup({})
--   end,
-- }

return {
  enabled = true,
  "brianhuster/live-preview.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
}
