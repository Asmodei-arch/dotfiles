return {
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--query-driver=/usr/bin/g++,/usr/bin/gcc",
			"--completion-style=detailed",
		},
	},
	dockerls = {},
	yamlls = {},
	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = {
			".luarc.json",
			".luarc.jsonc",
			".luacheckrc",
			".stylua.toml",
			"stylua.toml",
			"selene.toml",
			"selene.yml",
			".git",
		},
		settings = {
			Lua = {
				runtime = {
					version = "Lua 5.4",
				},
				completion = {
					enable = true,
				},
				diagnostics = {
					enable = true,
					globals = { "vim" },
				},
				workspace = {
					library = { vim.env.VIMRUNTIME },
					checkThirdParty = false,
				},
			},
		},
	},
	texlab = {
		settings = {
			texlab = {
				build = {
					executable = "latexmk",
					onSave = true,
					args = {
						"-pdf",
						"-interaction=nonstopmode",
						"-synctex=1",
						"-file-line-error",
						"%f",
					},
				},

				forwardSearch = {
					executable = "zathura",
					args = {
						"--synctex-forward",
						"%l:1:%f",
						"%p",
					},
				},
			},
		},
	},
}
