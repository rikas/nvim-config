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

-- Show dependency versions
vim.keymap.set(
  { "n" },
  "<leader>ns",
  require("package-info").show,
  { silent = true, noremap = true }
)

-- Hide dependency versions
vim.keymap.set(
  { "n" },
  "<leader>nc",
  require("package-info").hide,
  { silent = true, noremap = true }
)

-- Toggle dependency versions
vim.keymap.set(
  { "n" },
  "<leader>nt",
  require("package-info").toggle,
  { silent = true, noremap = true }
)

-- Update dependency on the line
vim.keymap.set(
  { "n" },
  "<leader>nu",
  require("package-info").update,
  { silent = true, noremap = true }
)

-- Delete dependency on the line
vim.keymap.set(
  { "n" },
  "<leader>nd",
  require("package-info").delete,
  { silent = true, noremap = true }
)

-- Install a new dependency
vim.keymap.set(
  { "n" },
  "<leader>ni",
  require("package-info").install,
  { silent = true, noremap = true }
)

-- Install a different dependency version
vim.keymap.set(
  { "n" },
  "<leader>np",
  require("package-info").change_version,
  { silent = true, noremap = true }
)
