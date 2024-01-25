-- Load my personal keymaps
require("rikas.keymaps")

-- Load lazy packages
require("plugins.lazy")

-- Colorscheme
require("plugins.catppuccin")

-- Load my vim options
require("rikas.options")

-- Load misc configurations (not related to any particular package)
require("rikas.misc")

-- Specific configs for plugins
require("plugins.indent-blankline")
-- require("plugins.incline") -- trying out bufferline so this is disabled
require("plugins.lsp-zero")
require("plugins.lualine")
require("plugins.mini-nvim")
require("plugins.nvim-colorizer")
require("plugins.nvim-neo-tree")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.gitsigns")
require("plugins.copilot")
require("plugins.package-info")
require("plugins.bufferline")
require("plugins.yanky")
require("plugins.conform")

-- Autocomplete setup
require("rikas.cmp")
