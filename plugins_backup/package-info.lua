require("package-info").setup({
  icons = {
    enable = true, -- Whether to display icons
    style = {
      up_to_date = " ", -- Icon for up to date dependencies
      outdated = " ", -- Icon for outdated dependencies
    },
  },
  autostart = true, -- Whether to autostart when `package.json` is opened
  hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
  hide_unstable_versions = true, -- It hides unstable versions from version list e.g next-11.1.3-canary3
})

vim.api.nvim_set_hl(0, "PackageInfoOutdatedVersion", { bg = "NONE", fg = "#ffce33" })
vim.api.nvim_set_hl(0, "PackageInfoUpToDateVersion", { bg = "NONE", fg = "#445544" })

-- TODO: add the keymap only on buffers that have a package.json file

-- Toggle dependency versions
vim.keymap.set(
  { "n" },
  "<leader>t",
  require("package-info").toggle,
  { desc = "Toggle dependency versions" }
)
