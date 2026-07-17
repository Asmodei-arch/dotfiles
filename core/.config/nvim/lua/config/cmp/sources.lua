return {
	default = { "lsp", "path", "lazydev" },

	providers = {
		lazydev = {
			module = "lazydev.integrations.blink",
			score_offset = 100,
		},
	},
}
