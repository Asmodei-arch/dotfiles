local formatters = require("config.format.formatters")

require("conform").setup({
  notify_on_error = false,

  format_on_save = function(bufnr)
    local ft = vim.bo[bufnr].filetype

    local disable = {
      c = true,
      cpp = true,
    }

    if disable[ft] then
      return nil
    end

    return {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  end,

  formatters_by_ft = formatters,
})
