return {
	"seblyng/roslyn.nvim",
	ft = { "cs", "razor" },

	config = function()
		vim.lsp.config("roslyn", {})
		vim.lsp.enable("roslyn")
	end,
}
