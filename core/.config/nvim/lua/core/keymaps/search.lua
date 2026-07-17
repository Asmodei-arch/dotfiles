local builtin = require("telescope.builtin")

local map = vim.keymap.set

map("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
map("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
map("n", "<leader>sg", builtin.live_grep, { desc = "Search Grep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
map("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
map("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })

map("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "Search in buffer" })

map("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep Open Files",
	})
end, { desc = "Search open files" })

vim.keymap("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Neovim config files" })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<leader>K", ":lua vim.lsp.buf.hover<CR>", opts)
vim.keymap.set("n", "<leader>gr", ":lua vim.lsp.buf.references<CR>", opts)
vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename<CR>", opts)
vim.keymap.set("n", "<leader>fo", ":lua vim.lsp.buf.format<CR>", opts)
