return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>cre", function() require('refactoring').refactor('Extract Function') end, desc = "Extract function", mode = {"v"} },
      { "<leader>crf", function() require('refactoring').refactor('Extract Function To File') end, desc="Extract function to file", mode = {"v"} },
      { "<leader>crv", function() require('refactoring').refactor('Extract Variable') end, desc="Extract variable", mode = {"v"} },
      { "<leader>crI", function() require('refactoring').refactor('Inline Function') end, desc="Inline function", mode= {"n"} },
      { "<leader>cri", function() require('refactoring').refactor('Inline Variable') end, desc="Inline Variable", mode={"n", "x"} },
    },
    config = function()
      require("refactoring").setup()
    end,
  },
}
