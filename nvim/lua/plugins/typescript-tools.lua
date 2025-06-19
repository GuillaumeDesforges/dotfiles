require("typescript-tools").setup({
	settings = {
		-- JSXCloseTag
		-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
		-- that maybe have a conflict if enable this feature. )
		jsx_close_tag = {
			enable = true,
			filetypes = { "javascriptreact", "typescriptreact" },
		}
	},
})
