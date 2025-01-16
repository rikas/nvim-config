return { -- Colorize color strings like "#ff5511" or "blue"
  "catgoose/nvim-colorizer.lua",
  opts = {
    filetypes = {
      "html",
      "erb",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      lua = { mode = "virtualtext" },
      scss = { mode = "virtualtext" },
      css = { mode = "virtualtext" },
    },
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue or blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = false, -- 0xAARRGGBB hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode = "background", -- Set the display mode.
      tailwind = true, -- Enable tailwind colors
      sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
      virtualtext = "",
      virtualtext_inline = "before",
      always_update = false,
    },
  },
}
