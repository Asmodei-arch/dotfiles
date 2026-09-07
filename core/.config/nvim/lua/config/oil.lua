local M = {}

function M.setup()
	require("oil").setup({
		default_file_explorer = true,
		columns = {
			"icon",
		},

		lsp_file_methods = {
			enabled = true,
			timeout_ms = 10000,
			autosave_changes = true,
		},
	})
end

return M
