return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.config",

	opts = function()
		return require("config.treesitter")
	end,
}
