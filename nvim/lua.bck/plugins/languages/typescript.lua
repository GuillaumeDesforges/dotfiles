return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- LSP Server Settings
      servers = {
        -- use typescript-tools instead
        tsserver = false,
        eslint = {},
      },
    },
  },
	{
		"stevearc/conform.nvim",
		opts = {
			---@type table<string, conform.FormatterUnit[]>
			formatters_by_ft = {
				typescript = { { "prettierd" }, { "prettier" }, stop_after_first = true  },
				typescriptreact = { { "prettierd" }, { "prettier" }, stop_after_first = true  },
			},
		},
	},
}
