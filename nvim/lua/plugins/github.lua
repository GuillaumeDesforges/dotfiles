return {
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
  {
    "ruifm/gitlinker.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
		config = function()
      require"gitlinker".setup()
		end,
  }
}
