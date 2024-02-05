return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- LSP Server Settings
      servers = {
        gopls = {},
        templ = {},
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
