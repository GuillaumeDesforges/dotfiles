return {
	{
		"stevearc/conform.nvim",
		opts = {
			---@type table<string, conform.FormatterUnit[]>
			formatters_by_ft = {
				nix = { { "nixpkgs_fmt" } },
			},
		},
	},
}
