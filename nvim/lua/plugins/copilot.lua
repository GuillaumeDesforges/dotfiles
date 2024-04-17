return {
  -- disable a few default mappings in favor of Copilot autocomplete
  {
    "L3MON4D3/LuaSnip",
    -- stylua: ignore
    keys = {
      -- removed in favor of Copilot
      { "<tab>", false, mode = "i" },
      { "<tab>", false, mode = "s" },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },
  -- setup Copilot suggestions
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<c-a>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        -- enabled
        c = true,
        haskell = true,
        javascript = true,
        lua = true,
        python = true,
        scala = true,
        typescript = true,
        -- disabled
        json = false,
        markdown = false,
        yaml = false,
      },
    },
  },
  -- add 'copilot' component to lualine, see ./ui.lua
  { "AndreM222/copilot-lualine" },
  -- setup Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {},
  },
}
