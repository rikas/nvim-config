-- Ruby LSP only supports pull diagnostics, and neovim versions prior to v0.10.0-dev-695+g58f948614
-- only support publishDiagnostics. Additional setup is required to enable diagnostics from Ruby
-- LSP to appear in neovim.

LSPRubyTimers = {}

function LSPRuby_setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      local diagnostic_items = {}
      if result then
        diagnostic_items = result.items
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if LSPRubyTimers[buffer] then
        vim.fn.timer_stop(LSPRubyTimers[buffer])
      end
      LSPRubyTimers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if LSPRubyTimers[buffer] then
        vim.fn.timer_stop(LSPRubyTimers[buffer])
      end
    end,
  })
end

