return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	opts = {
		-- LSP Server Settings
		servers = {
			lua_ls = {},
			rust_analyzer = {},
			templ = {},
			gopls = {},
		},
	},
}
