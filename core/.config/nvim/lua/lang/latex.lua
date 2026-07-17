vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_view_sioyek_exe = "sioyek"

vim.g.vimtex_compiler_method = "latexmk"

vim.g.vimtex_compiler_latexmk_engines = {
	_ = "-lualatex",
}

vim.g.vimtex_compiler_latexmk = {
	options = {
		"-lualatex",
		"-shell-escape",
		"-verbose",
		"-file-line-error",
		"-interaction=nonstopmode",
		"-synctex=1",
	},
}
