return {
	"mikavilpas/yazi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("config.yazi")
	end,
}
