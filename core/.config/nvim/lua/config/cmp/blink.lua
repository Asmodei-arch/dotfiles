return {
	keymap = {
		preset = "super-tab",
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = false,
			auto_show_delay_ms = 500,
		},
	},

	sources = require("config.cmp.sources"),

	snippets = {
		preset = "default",
	},

	fuzzy = {
		implementation = "lua",
	},

	signature = {
		enabled = true,
	},
}
