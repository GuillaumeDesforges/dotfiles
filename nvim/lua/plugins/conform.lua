local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		go = { "gofmt" },
	},
	format_on_save = {
		-- options of conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("which-key").add({
	{ '<leader>c',  group = 'Code' },
	{ '<leader>cf', function() conform.format() end, desc = 'Format' },
})
