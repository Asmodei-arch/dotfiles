local map = vim.keymap.set

local function lsp_map(mode, key, func, desc)
	map(mode, key, func, {
		noremap = true,
		silent = true,
		desc = desc,
	})
end

lsp_map("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
lsp_map("n", "<leader>K", vim.lsp.buf.hover, "Show hover information")
lsp_map("n", "<leader>gr", vim.lsp.buf.references, "Find references")
lsp_map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
lsp_map("n", "<leader>fo", vim.lsp.buf.format, "Format code")
lsp_map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

lsp_map("n", "<leader>fe", vim.diagnostic.open_float, "Show diagnostic float")
lsp_map("n", "[d", vim.diagnostic.get_prev, "Previous diagnostic")
lsp_map("n", "]d", vim.diagnostic.get_next, "Next diagnostic")

map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
