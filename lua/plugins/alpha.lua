local function reset_logo_hls()
  local green = vim.api.nvim_get_hl(0, { name = "DiagnosticOk" }).fg
  local blue = vim.api.nvim_get_hl(0, { name = "Function" }).fg
  local gray = vim.api.nvim_get_hl(0, { name = "Comment" }).fg

  vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = blue })
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = green })
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = green, bg = blue })
  vim.api.nvim_set_hl(0, "NeovimDashboardFooter", { fg = gray })
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",

  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    reset_logo_hls()

    dashboard.section.header.val = {
      [[     █  █     ]],
      [[     ██ ██     ]],
      [[     █████     ]],
      [[     ██ ███     ]],
      [[     █  █     ]],
      [[]],
      [[N  E  O   V  I  M]],
    }

    dashboard.section.header.opts.hl = {
      { { "NeovimDashboardLogo1", 6, 8 }, { "NeovimDashboardLogo3", 9, 22 } },
      {
        { "NeovimDashboardLogo1", 6, 8 },
        { "NeovimDashboardLogo2", 9, 11 },
        { "NeovimDashboardLogo3", 12, 24 },
      },
      { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 26 } },
      { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 24 } },
      { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 22 } },
    }

    dashboard.section.buttons.val = {
      dashboard.button("i", "    new file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("o", "    old files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", "󰥨    find file", ":Telescope find_files<CR>"),
      dashboard.button("g", "󰱼    find text", ":Telescope live_grep<CR>"),
      dashboard.button("h", "    browse git", ":LazyGit<CR>"),
      dashboard.button("l", "󰒲    lazy", ":Lazy<CR>"),
      dashboard.button("p", "    lazy profile", ":Lazy profile<CR>"),
      dashboard.button("m", "󱌣    mason", ":Mason<CR>"),
      dashboard.button("q", "    quit", ":qa<CR>"),
    }

    dashboard.section.footer.opts.hl = { { { "NeovimDashboardFooter", 5, 15 } } }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "Normal"
      button.opts.hl_shortcut = "Function"
    end

    dashboard.opts.layout = {
      { type = "padding", val = 4 },
      dashboard.section.header,
      { type = "padding", val = 4 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }
    return dashboard
  end,

  config = function(_, dashboard)
    -- close lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end
    require("alpha").setup(dashboard.opts)

    local augroup = vim.api.nvim_create_augroup("AlphaNvim", {})

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = augroup,
      callback = function()
        reset_logo_hls()
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      group = augroup,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "󱐋 " .. stats.count .. " plugins loaded in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
