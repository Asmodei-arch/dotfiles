local map = vim.keymap.set
-- cleal search
map("n", "<localleader>ls", "<cmd>VimtexCompileSS<CR>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<leader>q", vim.diagnostic.open_float, { desc = "Open diagnostic [Q]uickfix float" })

-- splits
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local fzf = require("fzf-lua")

map("n", "<leader>ff", fzf.files, {
	desc = "Find files",
})

map("n", "<leader>fg", fzf.live_grep, {
	desc = "Live grep",
})

map("n", "<leader>fb", fzf.buffers, {
	desc = "Buffers",
})

map("n", "<leader>fh", fzf.help_tags, {
	desc = "Help tags",
})

local opts = { noremap = true, silent = true }

map("n", "<leader>fo", ":lua vim.lsp.buf.format()<CR>", opts)

map("n", "<leader>e", "<cmd>Oil<CR>")

local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F4>", dap.terminate)

vim.keymap.set("n", "<F10>", dap.step_over)

vim.keymap.set("n", "<F11>", dap.step_into)

vim.keymap.set("n", "<F12>", dap.step_out)

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Set breakpoint" })

vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle dapui" })

require("core.keymaps.search")
