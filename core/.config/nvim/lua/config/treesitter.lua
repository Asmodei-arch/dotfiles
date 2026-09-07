return {
	ensure_installed = {
		"bash",
		"c",
		"make",
		"diff",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
		"latex",
		"bibtex",
		"cpp",
		"cmake",
		"dockerfile",
	},

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "ruby" },
	},

	indent = {
		enable = true,
		disable = { "ruby" },
	},
}
