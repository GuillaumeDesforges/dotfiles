return {
{
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
		  "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp-file-operations").setup {
        -- used to see debug logs in file `vim.fn.stdpath("cache") .. lsp-file-operations.log`
        debug = false,
        -- select which file operations to enable
        operations = {
          willRenameFiles = true,
          didRenameFiles = true,
          willCreateFiles = true,
          didCreateFiles = true,
          willDeleteFiles = true,
          didDeleteFiles = true,
        },
        -- how long to wait (in milliseconds) for file rename information before cancelling
        timeout_ms = 10000,
      }

      -- Set global defaults for all servers
      local lspconfig = require'lspconfig'
      lspconfig.util.default_config = vim.tbl_extend(
        'force',
        lspconfig.util.default_config,
        {
          capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            -- returns configured operations if setup() was already called
            -- or default operations if not
            require'lsp-file-operations'.default_capabilities()
          )
        }
      )
    end,
  },
}
