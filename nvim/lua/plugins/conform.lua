local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		go = { "gofmt" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		-- options of conform.format()
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

require("which-key").add({
	{ '<leader>c',  group = 'Code' },
	{ '<leader>cf', function() conform.format() end, desc = 'Format' },
})
