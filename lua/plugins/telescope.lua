local builtin = require("telescope.builtin")
local state = require("telescope.state")

-- Starts a new picker or resumes a cached one if it exists
local function resume_or_start(picker_name, picker_func, opts)
  return function()
    opts = opts or {}

    -- Try to find a cached picker with the same name
    local cached_pickers = state.get_global_key("cached_pickers") or {}
    local picker_index = nil

    -- Search through cached pickers to find matching one
    for i, cached_picker in ipairs(cached_pickers) do
      if cached_picker.prompt_title == (opts.prompt_title or picker_name) then
        picker_index = i
        break
      end
    end

    if picker_index then
      -- Resume the specific cached picker
      print("Resuming picker: " .. (opts.prompt_title or picker_name))
      builtin.resume({ cache_index = picker_index })
    else
      -- Start fresh picker
      picker_func(opts)
    end
  end
end

return {
  { -- Use native fzf (fzf needs to be installed on the system)
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
  },
  { -- Fuzzy finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["C-q"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
          cache_picker = {
            num_pickers = 100,
            ignore_empty_prompt = true,
          },
        },
        pickers = {
          find_files = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          buffers = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          help_tags = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          oldfiles = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          lsp_document_symbols = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
          grep_string = {
            previewer = true,
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
          },
        },
        extensions = {
          package_info = {
            theme = "cursor",
          },
        },
      })

      -- Extensions
      require("telescope").load_extension("harpoon")
      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word under cursor" })

      vim.keymap.set(
        "n",
        "<leader>fg",
        resume_or_start("Live Grep", builtin.live_grep),
        { desc = "Find in files (grep)" }
      )

      vim.keymap.set(
        "n",
        "<leader>fs",
        resume_or_start("LSP Document Symbols", builtin.lsp_document_symbols),
        { desc = "Find symbols" }
      )
    end,
  },
}
