local servers = require("config.lsp.servers")
local tools = require("config.lsp.tools")

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- tools (formatters/linters)
require("mason-tool-installer").setup({
	ensure_installed = tools,
})

-- LSP install + handlers
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = true,

	automatic_enable = { exclude = { "roslyn_ls" } },
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}

			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

			require("lspconfig")[server_name].setup(server)
		end,
	},
})
