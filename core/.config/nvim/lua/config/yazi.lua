return {
	open_for_directories = true,
	change_neovim_cwd_on_close = true,
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
