return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			-- LSP Server Settings
			servers = {
				clangd = {
          cmd = {
            "clangd",
            "--offset-encoding=utf-16",
          },
        },
			},
		},
	},
}
