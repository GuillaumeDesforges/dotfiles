return {
  {
    "stevearc/conform.nvim",
    opts = {
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        python = { { "ruff_check" }, { "ruff_format", "black" } },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    keys = {
      { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
      { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
    },
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- LSP Server Settings
      servers = {
        pyright = {
          settings = {
            pyright = { autoImportCompletion = true },
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
              },
            },
          },
        },
        ruff = {},
      },
    },
  },
}
