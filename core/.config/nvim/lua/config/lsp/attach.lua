local M = {}

local function map(buf, mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, {
    buffer = buf,
    desc = "LSP: " .. desc,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local buf = event.buf

    map(buf, "n", "grn", vim.lsp.buf.rename, "Rename")
    map(buf, { "n", "x" }, "gra", vim.lsp.buf.code_action, "Code Action")

    local telescope = require("telescope.builtin")

    map(buf, "n", "grr", telescope.lsp_references, "References")
    map(buf, "n", "grd", telescope.lsp_definitions, "Definition")
    map(buf, "n", "gri", telescope.lsp_implementations, "Implementation")
    map(buf, "n", "grt", telescope.lsp_type_definitions, "Type Definition")

    map(buf, "n", "gO", telescope.lsp_document_symbols, "Document Symbols")
    map(buf, "n", "gW", telescope.lsp_dynamic_workspace_symbols, "Workspace Symbols")

    -- inlay hints
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, buf) then
      map(buf, "n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
      end, "Toggle Inlay Hints")
    end
  end,
})

return M
