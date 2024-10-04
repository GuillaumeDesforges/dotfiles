return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- LSP Server Settings
      servers = {
        gopls = {
          cmd = { "gopls", "serve" },
          filetypes = { "go" },
          root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        templ = {},
      },
    },
  },
	{
		"stevearc/conform.nvim",
		opts = {
			---@type table<string, conform.FormatterUnit[]>
			formatters_by_ft = {
				go = { { "gofmt" } },
			},
		},
	},
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go",
        "templ",
      },
    },
  },
  -- Add support for templ filetype
  {
    "joerdav/templ.vim",
    config = function(_, _)
      vim.filetype.add({ extension = { templ = "templ" } })
    end,
  },
}
