return {
  -- required to detect Nickel files
  {
    "nickel-lang/vim-nickel",
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- LSP Server Settings
      servers = {
        nickel_ls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "nickel",
      },
    },
  }
}
